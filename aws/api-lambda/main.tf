
resource "aws_api_gateway_method" "this" {
  rest_api_id          = "${var.rest_api_id}"
  resource_id          = "${local.resource_id}"
  http_method          = "${var.http_method}"
  authorization        = "${var.method_authorization}"
  request_validator_id = "${aws_api_gateway_request_validator.this.id}"

  request_parameters = "${var.request_parameters}"

  lifecycle {
    create_before_destroy = false
  }

  depends_on = ["aws_api_gateway_request_validator.this"]
}

resource "aws_api_gateway_method_response" "this" {
  depends_on = ["aws_api_gateway_method.this"]

  rest_api_id = "${var.rest_api_id}"
  resource_id = "${local.resource_id}"
  http_method = "${var.http_method}"
  status_code = "${local.status_code}"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = true
  }
}

resource "aws_api_gateway_request_validator" "this" {
  name                        = "${local.resource_id}_${var.http_method}_validator"
  rest_api_id                 = "${var.rest_api_id}"
  validate_request_parameters = true
}

resource "aws_api_gateway_integration" "this" {
  depends_on = ["aws_api_gateway_method.this"]

  rest_api_id      = "${var.rest_api_id}"
  resource_id      = "${local.resource_id}"
  http_method      = "${var.http_method}"
  content_handling = "CONVERT_TO_TEXT"

  integration_http_method = "${local.integration_http_method}"
  type                    = "${local.integration_type}"

  uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${module.lambda.arn}:${var.lambda_alias_name}/invocations"

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_api_gateway_integration_response" "this" {
  depends_on = ["aws_api_gateway_integration.this"]

  rest_api_id = "${var.rest_api_id}"
  resource_id = "${local.resource_id}"
  http_method = "${var.http_method}"
  status_code = "${local.status_code}"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "integration.response.header.Access-Control-Allow-Origin"
  }
}
