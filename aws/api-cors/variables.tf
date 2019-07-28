
variable "rest_api_id" {}

variable "resource_id" {}

variable "allow_origin" {
  default = "'*'"
}
variable "allow_method" {
  default = null
}
variable "allow_header" {
  default = null
}
