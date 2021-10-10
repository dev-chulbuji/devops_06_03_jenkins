env   = "dev"
name  = "bastion"
owner = "dj.kim"
tags       = {}

# AMI
ami_owners = ["amazon"]
ami_filters = [
  {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
]

# EC2
instance_type = "t3.micro"
key_name = "dev"

# sg
sg_description = "Security group for Bastion EC2 instance"
ingress_cidr_blocks = [""]
ingress_rules = ["ssh-tcp"]
egress_rules = ["all-all"]

