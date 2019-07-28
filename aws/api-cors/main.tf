
resource "aws_api_gateway_method" "this" {
  rest_api_id   = "${var.rest_api_id}"
  resource_id   = "${var.resource_id}"
  http_method   = "OPTIONS"
  authorization = "NONE"

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_api_gateway_method_response" "this" {
  depends_on = ["aws_api_gateway_method.this"]

  rest_api_id = "${var.rest_api_id}"
  resource_id = "${var.resource_id}"
  http_method = "${aws_api_gateway_method.this.http_method}"
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin"  = false
  }
}

resource "aws_api_gateway_integration" "this" {
  depends_on = ["aws_api_gateway_method.this"]

  rest_api_id = "${var.rest_api_id}"
  resource_id = "${var.resource_id}"
  http_method = "${aws_api_gateway_method.this.http_method}"
  type        = "MOCK"

  request_templates = {
    "application/json" = "${jsonencode(local.status)}"
  }
}

resource "aws_api_gateway_integration_response" "this" {
  depends_on = ["aws_api_gateway_method_response.this"]

  rest_api_id = "${var.rest_api_id}"
  resource_id = "${var.resource_id}"
  http_method = "${aws_api_gateway_method.this.http_method}"
  status_code = "${aws_api_gateway_method_response.this.status_code}"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "${local.allow_header}",
    "method.response.header.Access-Control-Allow-Methods" = "${local.allow_method}"
    "method.response.header.Access-Control-Allow-Origin"  = "${var.allow_origin}"
  }

  response_templates = {
    "application/json" = ""
  }
}
