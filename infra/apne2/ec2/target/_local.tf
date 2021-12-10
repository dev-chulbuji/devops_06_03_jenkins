locals {
  region = var.region

  ec2_name     = format("%s-ec2", var.name)
  role_name    = format("%s-role", var.name)
  ssh_sg_name  = format("%s-ssh-sg", var.name)
  http_sg_name = format("%s-http-sg", var.name)

  target_names = [for cnt in range(0, var.target_count) : format("%s-%s-ec2", var.name, cnt)]

  tags = merge(var.tags, { Owner = var.owner, Environment = var.env })

  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  public_subnet_ids  = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  azs                = data.terraform_remote_state.vpc.outputs.azs
  default_sg_id      = data.terraform_remote_state.vpc.outputs.default_security_group_id

  ami_id        = data.aws_ami.this.id
  ami_owners    = var.ami_owners
  ami_filters   = var.ami_filters
  instance_type = var.instance_type
  key_name      = var.key_name

  http_sg_description      = var.http_sg_description
  http_ingress_cidr_blocks = var.http_ingress_cidr_blocks
  http_ingress_rules       = var.http_ingress_rules
  http_egress_rules        = var.http_egress_rules

  custom_role_policy_arns = var.custom_role_policy_arns
  trusted_role_services   = var.trusted_role_services
}