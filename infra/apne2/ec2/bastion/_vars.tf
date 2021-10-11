variable "env" {}
variable "name" {}
variable "owner" {}

variable "ami_owners" {}
variable "ami_filters" {}
variable "instance_type" {}
variable "key_name" {}

variable "ssh_sg_description" {}
variable "ssh_ingress_cidr_blocks" {}
variable "ssh_ingress_rules" {}
variable "ssh_egress_rules" {}

variable "http_sg_description" {}
variable "http_ingress_cidr_blocks" {}
variable "http_ingress_rules" {}
variable "http_egress_rules" {}