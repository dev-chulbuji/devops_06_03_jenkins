variable "env" {}
variable "name" {}
variable "owner" {}

variable "jenkins_key" {}

# sg
variable "http_sg_description" {}
variable "http_ingress_cidr_blocks" {}
variable "http_ingress_rules" {}
variable "http_egress_rules" {}

# alb
variable "http_tcp_listeners" {}
variable "http_tcp_listener_rules" {}
variable "target_type" {}
variable "backend_protocol" {}
variable "backend_port" {}