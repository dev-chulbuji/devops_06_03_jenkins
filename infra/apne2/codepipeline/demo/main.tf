resource "aws_codepipeline" "codepipeline" {
  name     = local.codepipeline_name
  role_arn = module.iam.iam_role_arn

  artifact_store {
    location = local.codepipeline_s3_artifact_name
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = local.codepipeline_source_config
    }
  }

  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = local.codepipeline_build_config
    }
  }

  stage {
    name = "Approve"
    action {
      name     = "Approval"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"
    }
  }

  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      input_artifacts = ["build_output"]
      version         = "1"

      configuration = local.codepipeline_deploy_config
    }
  }
}

resource "aws_codestarconnections_connection" "this" {
  name          = local.codepipeline_github_connection_name
  provider_type = "GitHub"
}

# iam
module "iam" {
  source                  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version                 = "~> 4.3"
  create_role             = true
  create_instance_profile = true
  role_name               = local.role_name
  role_requires_mfa       = false
  trusted_role_services   = local.trusted_role_services
  custom_role_policy_arns = local.custom_role_policy_arns
}

# s3
module "s3_artifact" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  bucket        = local.codepipeline_s3_artifact_name
  acl           = "private"
  force_destroy = true
  versioning    = { enabled = false }
  tags          = merge(local.tags, { Name = local.codepipeline_s3_artifact_name })
}