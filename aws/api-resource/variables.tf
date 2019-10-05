# ------------------------------------------------------------------------------------------------
# The ID of the associated REST API
# ------------------------------------------------------------------------------------------------
variable "rest_api_id" {}
# ------------------------------------------------------------------------------------------------
# The ID of the parent API resource
# ------------------------------------------------------------------------------------------------
variable "parent_id" {}
# ------------------------------------------------------------------------------------------------
# The last path segment of this API resource.
# ------------------------------------------------------------------------------------------------
variable "path_part" {}
# ------------------------------------------------------------------------------------------------
# CORS Enabled
# ------------------------------------------------------------------------------------------------
variable "cors_enabled" {
  default = false
}
# ------------------------------------------------------------------------------------------------
# CORS Allow Orgiin
# ------------------------------------------------------------------------------------------------
variable "allow_origin" {
  default = "'*'"
}
# ------------------------------------------------------------------------------------------------
# CORS Allow Methods
# ------------------------------------------------------------------------------------------------
variable "allow_method" {
  default = "'GET,OPTIONS,POST,PUT'"
}
# ------------------------------------------------------------------------------------------------
# CORS Allow Headers
# ------------------------------------------------------------------------------------------------
variable "allow_header" {
  default = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
}
