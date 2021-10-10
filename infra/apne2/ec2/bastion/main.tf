module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = local.ec2_name

  ami                         = local.ami_id
  key_name                    = local.key_name
  instance_type               = local.instance_type
  availability_zone           = element(local.azs, 0)
  subnet_id                   = element(local.public_subnet_ids, 0)
  vpc_security_group_ids      = [module.sg.security_group_id]
  associate_public_ip_address = true

  tags = local.tags
}

module "sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.sg_name
  description = local.sg_description
  vpc_id      = local.vpc_id

  ingress_cidr_blocks = local.ingress_cidr_blocks
  ingress_rules       = local.ingress_rules
  egress_rules        = local.egress_rules

  tags = local.tags
}