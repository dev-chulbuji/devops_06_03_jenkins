locals {
  region = var.region

  role_name              = format("%s-codedeploy-role", var.name)
  deployment_config_name = format("%s-codedeploy-config", var.name)
  deployment_group_name  = format("%s-codedeploy-group", var.name)

  tags = merge(var.tags, { Owner = var.owner, Environment = var.env })

  # iam
  trusted_role_services   = var.trusted_role_services
  custom_role_policy_arns = var.custom_role_policy_arns

  # codedeploy
  ec2_tag_filter   = var.ec2_tag_filter
  compute_platform = var.compute_platform

  # codedeployapp
  app_name = data.terraform_remote_state.app.outputs.name
}