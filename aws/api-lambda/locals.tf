locals {
  configs_path               = "./configs"
  lambda_full_name           = "${var.project_name}-${var.lambda_function_name}"
  lambda_default_role_name   = "${var.project_name}_${var.lambda_function_name}Role"
  lambda_role_name           = "${var.lambda_role_name != null ? var.lambda_role_name : local.lambda_default_role_name}"
  lambda_has_alias           = "${var.lambda_alias_name != null}"
  lambda_uri_alias           = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${module.lambda.arn}:${var.lambda_alias_name}/invocations"
  lambda_uri_no_alias        = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${module.lambda.arn}/invocations"
  lambda_uri                 = "${local.lambda_has_alias ? local.lambda_uri_alias : local.lambda_uri_no_alias}"
  count_api_gateway_resource = "${var.method_path_part != "" ? 1 : 0}"

  resource_path_src       = "${local.count_api_gateway_resource > 0 ? aws_api_gateway_resource.this.0.path : var.method_parent_path}"
  resource_path           = "${replace(local.resource_path_src, "/(\\{.*?\\})+/", "*")}"
  resource_id             = "${local.count_api_gateway_resource > 0 ? aws_api_gateway_resource.this.0.id : var.method_parent_id}"
  integration_http_method = "POST"
  integration_type        = "AWS_PROXY"
  status_code             = "200"
}

data "aws_caller_identity" "current" {}
