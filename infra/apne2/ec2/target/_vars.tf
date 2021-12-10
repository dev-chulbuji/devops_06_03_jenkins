variable "env" {}
variable "name" {}
variable "owner" {}

variable "ami_owners" {}
variable "ami_filters" {}
variable "instance_type" {}
variable "key_name" {}
variable "target_count" {}
variable "private_ips" {}

variable "http_sg_description" {}
variable "http_ingress_cidr_blocks" {}
variable "http_ingress_rules" {}
variable "http_egress_rules" {}

variable "custom_role_policy_arns" {}
variable "trusted_role_services" {}