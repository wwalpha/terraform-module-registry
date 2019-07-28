locals {
  configs_path = "./configs"

  lambda_full_name = "${var.project_name}-${var.lambda_function_name}"

  count_api_gateway_resource = "${var.method_path_part != "" ? 1 : 0}"

  resource_path_src = "${local.count_api_gateway_resource > 0 ? aws_api_gateway_resource.this[0].path : var.method_parent_path}"

  resource_path = "${replace(local.resource_path_src, "/(\\{.*?\\})+/", "*")}"

  resource_id = "${local.count_api_gateway_resource > 0 ? aws_api_gateway_resource.this[0].id : var.method_parent_id}"

  integration_http_method = "POST"
  integration_type        = "AWS_PROXY"

  status_code = "200"
}

data "aws_caller_identity" "current" {}
