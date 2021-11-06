env   = "dev"
name  = "jenkins-slave"
owner = "dj.kim"
tags  = {}

# iam
trusted_role_services = ["codedeploy.amazonaws.com"]
custom_role_policy_arns = [
  "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
]

compute_platform = "Server"
ec2_tag_filter = [
  {
    key   = "Name"
    type  = "KEY_AND_VALUE"
    value = "target-ec2"
  }
]