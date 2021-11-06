locals {
  region = var.region

  role_name   = format("%s-codebuild-role", var.name)
  bucket_name = format("%s-codebuild-s3", var.name)
  bucket_cache_name = format("%s-cache-codebuild-s3", var.name)
  bucket_artifact_name = format("%s-artifact-codebuild-s3", var.name)

  codebuild_name      = format("%s-codebuild", var.name)
  codebuild_timeout   = var.codebuild_timeout
  codebuild_envs      = var.codebuild_envs
  codebuild_source_s3 = format("%s/%s", local.bucket_name, var.codebuild_source_s3)
  codebuild_buildspec = var.codebuild_buildspec

  tags = merge(var.tags, { Owner = var.owner, Environment = var.env })

  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  public_subnet_ids  = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  azs                = data.terraform_remote_state.vpc.outputs.azs
  default_sg_id      = data.terraform_remote_state.vpc.outputs.default_security_group_id

  trusted_role_services   = var.trusted_role_services
  custom_role_policy_arns = var.custom_role_policy_arns

  codebuild_cache = {
    type = var.codebuild_cache_type
    modes = var.codebuild_cache_type == "LOCAL" ? ["LOCAL_DOCKER_LAYER_CACHE", "LOCAL_SOURCE_CACHE"] : null
    location = var.codebuild_cache_type == "LOCAL" ? null : local.bucket_cache_name
  }
}