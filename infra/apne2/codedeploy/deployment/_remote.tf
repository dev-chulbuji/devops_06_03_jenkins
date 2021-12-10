data "terraform_remote_state" "app" {
  backend = "s3"
  config = {
    bucket = var.backend_s3
    key    = var.codedeploy_app_key
    region = var.region
  }
}