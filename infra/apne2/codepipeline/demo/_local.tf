locals {
  region = var.region
  tags   = merge(var.tags, { Owner = var.owner, Environment = var.env })

  vpc_id              = data.terraform_remote_state.vpc.outputs.vpc_id
  public_subnet_ids   = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  private_subnet_ids  = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  azs                 = data.terraform_remote_state.vpc.outputs.azs
  default_sg_id       = data.terraform_remote_state.vpc.outputs.default_security_group_id
  codebuild_name      = data.terraform_remote_state.codebuild.outputs.name
  codedeploy_app_name = data.terraform_remote_state.app.outputs.name
  codedeploy_dg_name  = data.terraform_remote_state.dg.outputs.name

  # iam
  role_name               = format("%s-pipeline-role", var.name)
  trusted_role_services   = var.trusted_role_services
  custom_role_policy_arns = var.custom_role_policy_arns

  codepipeline_name                   = format("%s-pipeline", var.name)
  codepipeline_github_connection_name = format("%s-github-connection", var.name)
  codepipeline_s3_artifact_name       = format("%s-artifact-s3", var.name)

  codepipeline_source_config = {
    ConnectionArn    = aws_codestarconnections_connection.this.arn
    FullRepositoryId = "dev-chulbuji/devops_sample_app_python"
    BranchName       = "master"
  }

  codepipeline_build_config = {
    ProjectName = local.codebuild_name
  }

  codepipeline_deploy_config = {
    ApplicationName     = local.codedeploy_app_name
    DeploymentGroupName = local.codedeploy_dg_name
  }
}