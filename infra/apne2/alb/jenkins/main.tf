# http sg
module "http" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.http_sg_name
  description = local.http_sg_description
  vpc_id      = local.vpc_id

  ingress_cidr_blocks = local.http_ingress_cidr_blocks
  ingress_rules       = local.http_ingress_rules
  egress_rules        = local.http_egress_rules

  tags = local.tags
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = local.name

  load_balancer_type = "application"

  vpc_id                  = local.vpc_id
  security_groups         = [module.http.security_group_id, local.default_sg_id]
  subnets                 = local.public_subnet_ids
  http_tcp_listeners      = local.http_tcp_listeners
  http_tcp_listener_rules = local.http_tcp_listener_rules
  target_groups           = local.target_groups

  tags = local.tags
}