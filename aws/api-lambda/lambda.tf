module "lambda" {
  source = "../lambda"

  // Lambda Function
  function_name         = "${local.lambda_full_name}"
  description           = "${var.lambda_description}"
  role_name             = "${local.lambda_role_name}"
  role_policy_json      = "${var.lambda_role_policy_json}"
  handler               = "${var.lambda_handler}"
  runtime               = "${var.lambda_runtime}"
  memory_size           = "${var.lambda_memory_size}"
  timeout               = "${var.lambda_timeout}"
  layers                = "${var.lambda_layers}"
  publish               = "${var.lambda_publish}"
  variables             = "${var.lambda_envs}"
  tags                  = "${var.lambda_tags}"
  filename              = "${var.lambda_filename}"
  source_code_hash      = "${var.lambda_source_code_hash}"
  enable_dummy          = "${local.lambda_enable_dummy}"
  enable_xray           = "${var.lambda_enable_xray}"
  alias_name            = "${var.lambda_alias_name}"
  log_retention_in_days = "${var.lambda_log_retention_in_days}"
}

# ------------------------------
# AWS Lambda Role Permission
# ------------------------------
resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromAPIGateway"
  principal     = "apigateway.amazonaws.com"
  action        = "lambda:InvokeFunction"
  function_name = "${module.lambda.arn}"
  qualifier     = "${var.lambda_alias_name}"

  source_arn = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${var.rest_api_id}/*/${var.http_method}${local.resource_path}"
}

