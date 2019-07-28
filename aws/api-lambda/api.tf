resource "aws_api_gateway_resource" "this" {
  rest_api_id = "${var.rest_api_id}"
  parent_id   = "${var.method_parent_id}"
  path_part   = "${var.method_path_part}"

  count = "${local.count_api_gateway_resource}"
}
