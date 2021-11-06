resource "aws_codedeploy_deployment_config" "this" {
  deployment_config_name = local.deployment_config_name
  compute_platform = local.compute_platform

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 1
  }

#  minimum_healthy_hosts {
#    type = "FLEET_PERCENT"
#    value = 50
#  }
}