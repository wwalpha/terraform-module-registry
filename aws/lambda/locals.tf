locals {
  default_assume_role_policy = "${var.edge ? data.aws_iam_policy_document.edge_assume_role.json : data.aws_iam_policy_document.assume_role.json}"
  assume_role_policy         = "${var.assume_role_policy != null ? var.assume_role_policy : local.default_assume_role_policy}"

  empty_array = []
  empty_map   = {}

  dead_letter_config      = "${var.target_arn != null ? tolist(var.target_arn) : local.empty_array}"
  environment             = "${var.variables != null ? tolist(var.variables) : local.empty_array}"
  mode                    = "${var.xray_enabled ? "Active" : var.mode}"
  tracing_config          = "${local.mode != null ? tolist(local.mode) : local.empty_array}"
  vpc_config              = "${var.subnet_ids != null ? map("subnet_ids", var.subnet_ids, "security_group_ids", var.security_group_ids) : local.empty_map}"
  routing_config          = "${var.additional_version_weights != null ? list(var.additional_version_weights) : local.empty_array}"
  filename                = "${var.dummy_enabled ? "${path.module}/index.zip" : var.filename}"
  source_code_hash        = "${var.dummy_enabled ? "${filebase64sha256("${path.module}/index.zip")}" : var.source_code_hash}"
  ignore_changes          = "${var.publish ? list("source_code_hash", "qualified_arn", "version", "last_modified") : null}"
  aws_lambda_function     = "${var.dummy_enabled ? aws_lambda_function.dummy[0] : aws_lambda_function.this[0]}"
  aws_xray_write_only_arn = "arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess"

  enable_permission_smarthome = "${var.trigger_principal == "alexa-connectedhome.amazon.com" ? 1 : 0}"
  enable_permission_others    = "${var.trigger_principal == null ? 0 : local.permission_others}"
  permission_others           = "${var.trigger_principal == "alexa-connectedhome.amazon.com" ? 0 : 1}"
}
