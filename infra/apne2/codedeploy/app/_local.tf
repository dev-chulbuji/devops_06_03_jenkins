locals {
  app_name         = format("%s-codedeploy-app", var.name)
  compute_platform = var.compute_platform
  tags             = merge(var.tags, { Owner = var.owner, Environment = var.env })
}