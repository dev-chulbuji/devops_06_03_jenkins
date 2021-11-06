variable "backend_s3" {
  default = "devops-dev-tfbackend-s3"
}

variable "region" {
  default = "ap-northeast-2"
}

variable "vpc_key" {
  default = "dev/apne2/network/vpc/terraform.tfstate"
}

variable "tags" {}