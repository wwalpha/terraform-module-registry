output "resource_id" {
  value = "${local.resource_id}"
}
output "resource_path" {
  value = "${local.resource_path}"
}
output "resource_path_src" {
  value = "${local.resource_path_src}"
}
output "resource_path_new" {
  value = "${aws_api_gateway_resource.this.0.path}"
}
output "lambda_function_name" {
  value = "${var.lambda_function_name}"
}
output "lambda_full_name" {
  value = "${local.lambda_function_name}"
}
output "lambda_alias_arn" {
  value = "${module.lambda.alias_arn}"
}
# output "integration_arn" {
#   value = "${aws_api_gateway_integration.this.arn}"
# }
