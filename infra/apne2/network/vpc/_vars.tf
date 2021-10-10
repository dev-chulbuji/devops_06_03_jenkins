variable "env" {}
variable "name" {}
variable "owner" {}
variable "region" {}

variable "vpc_cidr" {}
variable "azs" {}
variable "private_subnets" {}
variable "public_subnets" {}
variable "enable_ipv6" {
  default = false
}
variable "enable_nat_gateway" {
  default = false
}
variable "single_nat_gateway" {
  default = true
}
variable "private_subnet_tags" {}
variable "public_subnet_tags" {}
variable "vpc_tags" {}
variable "tags" {}