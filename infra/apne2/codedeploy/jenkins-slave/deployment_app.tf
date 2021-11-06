resource "aws_codedeploy_app" "this" {
  compute_platform = local.compute_platform
  name             = local.app_name

  tags = merge(local.tags, { Name = local.app_name })
}