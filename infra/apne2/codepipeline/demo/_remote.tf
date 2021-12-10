data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.backend_s3
    key    = var.vpc_key
    region = var.region
  }
}

data "terraform_remote_state" "codebuild" {
  backend = "s3"
  config = {
    bucket = var.backend_s3
    key    = var.codebuild_key
    region = var.region
  }
}

data "terraform_remote_state" "app" {
  backend = "s3"
  config = {
    bucket = var.backend_s3
    key    = var.codedeploy_app_key
    region = var.region
  }
}

data "terraform_remote_state" "dg" {
  backend = "s3"
  config = {
    bucket = var.backend_s3
    key    = var.codedeploy_deployment_group_key
    region = var.region
  }
}