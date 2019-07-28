# API Gateway Enable CORS Module

## Usage

```
module "CORS" {
  source = "github.com/wwalpha/terraform-modules-api-cors"

  rest_api_id = "${aws_api_gateway_rest_api.this.id}"
  resource_id = "${aws_api_gateway_rest_api.this.root_resource_id}"

  allow_header = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
  allow_method = "'DELETE,GET,PUT,OPTIONS'"
  allow_origin = "'*'"
}
```

## Default value
**シングルクォーテーション**が必要なので、ご注意ください。

- allow_header
  - "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
- allow_method
  - "'GET,OPTIONS,POST,PUT'"
- allow_origin
  - "'*'"
