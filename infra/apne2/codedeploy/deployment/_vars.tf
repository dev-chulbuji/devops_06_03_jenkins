variable "env" {}
variable "name" {}
variable "owner" {}

# iam
variable "trusted_role_services" {}
variable "custom_role_policy_arns" {}

# codedeploy
variable "compute_platform" {}
variable "ec2_tag_filter" {}
variable "codedeploy_app_key" {}