# iam
module "iam" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 4.3"

  create_role             = true
  create_instance_profile = true
  role_name               = local.role_name
  role_requires_mfa       = false

  trusted_role_services   = local.trusted_role_services
  custom_role_policy_arns = local.custom_role_policy_arns
}

# s3
module "s3" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket        = local.bucket_name
  acl           = "private"
  force_destroy = false
  versioning    = { enabled = true }

  tags = merge(local.tags, { Name = local.bucket_name })
}

module "s3_cache" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket        = local.bucket_cache_name
  acl           = "private"
  force_destroy = false
  versioning    = { enabled = false }

  tags = merge(local.tags, { Name = local.bucket_cache_name })
}

module "s3_artifact" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket        = local.bucket_artifact_name
  acl           = "private"
  force_destroy = false
  versioning    = { enabled = false }

  tags = merge(local.tags, { Name = local.bucket_artifact_name })
}

# codebuild
resource "aws_codebuild_project" "this" {
  name          = local.codebuild_name
  build_timeout = local.codebuild_timeout
  service_role  = module.iam.iam_role_arn

  cache {
    type     = lookup(local.codebuild_cache, "type", null)
    location = lookup(local.codebuild_cache, "location", null)
    modes    = lookup(local.codebuild_cache, "modes", null)
  }

  source {
    type      = "S3"
    location  = local.codebuild_source_s3
    buildspec = local.codebuild_buildspec
  }

  dynamic "environment" {
    for_each = length(keys(local.codebuild_envs)) == 0 ? [] : [local.codebuild_envs]
    content {
      compute_type    = environment.value.compute_type
      image           = environment.value.image
      type            = environment.value.type
      privileged_mode = environment.value.privileged_mode
    }
  }

  vpc_config {
    vpc_id             = local.vpc_id
    subnets            = local.private_subnet_ids
    security_group_ids = [local.default_sg_id]
  }

  artifacts {
    type = "S3"
    override_artifact_name = true
    packaging = "ZIP"
    location = local.bucket_artifact_name
    namespace_type = "BUILD_ID"
  }

  tags = merge(local.tags, { Name = local.codebuild_name })
}