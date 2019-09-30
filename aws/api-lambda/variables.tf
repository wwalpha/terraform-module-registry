# ------------------------------
# AWS Common
# ------------------------------
variable "region" {}
variable "project_name" {}

# ------------------------------
# Amazon API Gateway 
# ------------------------------
variable "rest_api_id" {}

# ------------------------------
# Amazon API Gateway Method
# ------------------------------
variable "http_method" {
  default = "GET"
}

variable "method_parent_id" {}

variable "method_parent_path" {}

variable "method_path_part" {
  default = ""
}

variable "method_authorization" {
  default = "NONE"
}
variable "method_authorizer_id" {}
variable "request_parameters" {
  type    = "map"
  default = {}
}

# variable "allow_headers" {
#   default = null
# }
# variable "allow_methods" {
#   default = null
# }
# variable "allow_origin" {
#   default = null
# }
variable "enable_cors" {
  default = true
}

# ------------------------------
# AWS Lambda Function
# ------------------------------
variable "lambda_filename" {
  default = ""
}

# variable "lambda_s3_bucket" {
#   default = ""
# }

# variable "lambda_s3_key" {
#   default = ""
# }

# variable "lambda_s3_object_version" {
#   default = ""
# }

variable "lambda_function_name" {}

variable "lambda_handler" {}

variable "lambda_description" {
  default = ""
}

variable "lambda_layers" {
  default = []
}

variable "lambda_memory_size" {
  default = 128
}

variable "lambda_runtime" {}

variable "lambda_role_name" {}
variable "lambda_timeout" {
  default = 10
}
variable "lambda_reserved_concurrent_executions" {
  default = -1
}
variable "lambda_envs" {
  type = "map"
}
variable "lambda_tags" {
  default = {}
}
variable "lambda_log_retention_in_days" {
  default = 30
}
variable "lambda_role_policy_json" {
  default = []
}
variable "lambda_publish" {
  default = true
}
variable "lambda_enable_dummy" {
  default = true
}
variable "lambda_enable_xray" {
  default = true
}
# dead_letter_config - (Optional) Nested block to configure the function's dead letter queue. See details below.
# vpc_config - (Optional) Provide this to allow your function to access your VPC. Fields documented below. See Lambda in VPC
# kms_key_arn - (Optional) The ARN for the KMS encryption key.
# source_code_hash - (Optional) Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key. The usual way to set this is ${base64sha256(file("file.zip"))}, where "file.zip" is the local filename of the lambda function source archive.
# dead_letter_config is a child block with a single argument:
# target_arn - (Required) The ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the sns:Publish or sqs:SendMessage action on this ARN, depending on which service is targeted.
# tracing_config is a child block with a single argument:
# vpc_config requires the following:
# subnet_ids - (Required) A list of subnet IDs associated with the Lambda function.
# security_group_ids - (Required) A list of security group IDs associated with the Lambda function.

# ------------------------------
# AWS Lambda Function Alias
# ------------------------------
variable "lambda_alias_name" {
  default = "dev"
}
# variable "lambda_alias_description" {
#   default = null
# }
