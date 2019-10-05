
resource "aws_api_gateway_method" "this" {
  rest_api_id   = "${aws_api_gateway_rest_api.this.id}"
  resource_id   = "${aws_api_gateway_rest_api.this.root_resource_id}"
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "this" {
  rest_api_id = "${aws_api_gateway_rest_api.this.id}"
  resource_id = "${aws_api_gateway_rest_api.this.root_resource_id}"
  http_method = "${aws_api_gateway_method.this.http_method}"
  type        = "MOCK"

  request_parameters = {
    "integration.request.header.X-Authorization" = "'static'"
  }
}
