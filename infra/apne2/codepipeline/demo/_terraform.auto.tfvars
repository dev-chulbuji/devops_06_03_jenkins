env   = "dev"
name  = "demo"
owner = "dj.kim"
tags  = {}

# iam
trusted_role_services = ["codepipeline.amazonaws.com"]
custom_role_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  "arn:aws:iam::aws:policy/AWSCodeStarFullAccess",
  "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess",
  "arn:aws:iam::aws:policy/AWSCodeDeployFullAccess",
]

codebuild_key = "dev/apne2/codebuild/jenkins-slave/terraform.tfstate"
codedeploy_app_key = "dev/apne2/codedeploy/app/terraform.tfstate"
codedeploy_deployment_group_key = "dev/apne2/codedeploy/deployment/terraform.tfstate"