data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.backend_s3
    key    = var.vpc_key
    region = var.region
  }
}

data "terraform_remote_state" "jenkins" {
  backend = "s3"
  config = {
    bucket = var.backend_s3
    key    = var.jenkins_key
    region = var.region
  }
}