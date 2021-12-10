module "ec2" {
  count  = length(local.slave_names)
  source = "terraform-aws-modules/ec2-instance/aws"

  name = local.slave_names[count.index]

  ami                         = local.ami_id
  key_name                    = local.key_name
  instance_type               = local.instance_type
  availability_zone           = element(local.azs, count.index % 2)
  subnet_id                   = element(local.private_subnet_ids, count.index % 2)
  vpc_security_group_ids      = [local.default_sg_id]
  iam_instance_profile        = module.iam.iam_instance_profile_name
  associate_public_ip_address = false

  tags = merge(local.tags, { Name = local.slave_names[count.index] })
}

# iam
module "iam" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 4.3"

  create_role             = true
  create_instance_profile = true
  role_name               = local.role_name
  role_requires_mfa       = false

  trusted_role_services = local.trusted_role_services
  custom_role_policy_arns = local.custom_role_policy_arns
}