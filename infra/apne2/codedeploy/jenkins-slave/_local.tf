locals {
  region = var.region

  role_name              = format("%s-codedeploy-role", var.name)
  app_name               = format("%s-codedeploy-app", var.name)
  deployment_config_name = format("%s-codedeploy-config", var.name)
  deployment_group_name  = format("%s-codedeploy-group", var.name)

  tags = merge(var.tags, { Owner = var.owner, Environment = var.env })

  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  azs                = data.terraform_remote_state.vpc.outputs.azs
  default_sg_id      = data.terraform_remote_state.vpc.outputs.default_security_group_id

  # iam
  trusted_role_services   = var.trusted_role_services
  custom_role_policy_arns = var.custom_role_policy_arns

  # codedeploy
  compute_platform = var.compute_platform
  ec2_tag_filter   = var.ec2_tag_filter
}