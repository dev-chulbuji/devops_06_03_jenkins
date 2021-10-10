locals {
  region   = var.region

  ec2_name = format("%s-ec2", var.name)
  sg_name  = format("%s-sg", var.name)

  tags = merge(var.tags, { Owner = var.owner, Environment = var.env })

  vpc_id            = data.terraform_remote_state.vpc.outputs.vpc_id
  public_subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  azs               = data.terraform_remote_state.vpc.outputs.azs

  ami_id        = data.aws_ami.this.id
  ami_owners    = var.ami_owners
  ami_filters   = var.ami_filters
  instance_type = var.instance_type
  key_name = var.key_name

  sg_description      = var.sg_description
  ingress_cidr_blocks = var.ingress_cidr_blocks
  ingress_rules       = var.ingress_rules
  egress_rules        = var.egress_rules
}