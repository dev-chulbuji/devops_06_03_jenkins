output "ids" {
  value = module.ec2.*.id
}

output "ips" {
  value = module.ec2.*.public_ip
}

output "instance_profile_name" {
  value = module.iam.iam_instance_profile_name
}

output "sg_id" {
  value = module.sg.security_group_id
}