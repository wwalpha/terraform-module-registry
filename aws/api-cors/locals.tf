locals {
  const_allow_method = "'GET,OPTIONS,POST,PUT'"

  const_allow_header = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"

  allow_method = "${var.allow_method == null ? local.const_allow_method : var.allow_method}"

  allow_header = "${var.allow_header == null ? local.const_allow_header : var.allow_header}"

  status = {
    statusCode = 200
  }
}
