locals {
  configs_path                 = "./configs"
  lambda_default_function_name = "${var.project_name}_${var.lambda_function_name}"
  lambda_function_name         = "${var.lambda_function_name != null ? var.lambda_function_name : local.lambda_default_function_name}"
  lambda_default_role_name     = "${local.lambda_default_function_name}Role"
  lambda_role_name             = "${var.lambda_role_name != null ? var.lambda_role_name : local.lambda_default_role_name}"
  lambda_uri_prefix            = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${module.lambda.arn}"
  lambda_uri                   = "${var.lambda_alias_name != null ? "${local.lambda_uri_prefix}:${var.lambda_alias_name}/invocations" : "${local.lambda_uri_prefix}/invocations"}"
  lambda_dummy_enabled         = "${var.lambda_filename != null ? false : var.lambda_dummy_enabled}"
  lambda_alias_name            = "${var.lambda_alias_enabled ? var.lambda_alias_name : null}"
  count_api_gateway_resource   = "${var.method_path_part != "" ? 1 : 0}"

  resource_path_src       = "${local.count_api_gateway_resource > 0 ? aws_api_gateway_resource.this.0.path : var.method_parent_path}"
  resource_path           = "${replace(local.resource_path_src, "/(\\{.*?\\})+/", "*")}"
  resource_id             = "${local.count_api_gateway_resource > 0 ? aws_api_gateway_resource.this.0.id : var.method_parent_id}"
  integration_http_method = "POST"
  integration_type        = "AWS_PROXY"
  status_code             = "200"
}

data "aws_caller_identity" "current" {}
