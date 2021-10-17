env   = "dev"
name  = "bastion"
owner = "dj.kim"
tags  = {}

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
key_name      = "dev"

# ssh sg
ssh_sg_description      = "SSH Security group for Bastion EC2 instance"
ssh_ingress_cidr_blocks = ["211.106.116.65/32"]
ssh_ingress_rules       = ["ssh-tcp"]
ssh_egress_rules        = ["all-all"]

