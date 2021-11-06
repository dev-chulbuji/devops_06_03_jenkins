variable "env" {}
variable "name" {}
variable "owner" {}

# iam
variable "trusted_role_services" {}
variable "custom_role_policy_arns" {}

# codebuild
variable "codebuild_timeout" {}
variable "codebuild_envs" {}
variable "codebuild_source_s3" {}
variable "codebuild_cache_type" {}
variable "codebuild_buildspec" {
  type    = string
  default = <<EOF
version: 0.2

phases:
  #install:
    #commands:
      # - command
      # - command
  #pre_build:
    #commands:
      # - command
      # - command
  build:
    commands:
      - echo "hello world"
      # - command
  #post_build:
    #commands:
      # - command
      # - command
#artifacts:
  #files:
    # - location
    # - location
  #name: $(date +%Y-%m-%d)
  #discard-paths: yes
  #base-directory: location
#cache:
  #paths:
    # - paths
EOF
}