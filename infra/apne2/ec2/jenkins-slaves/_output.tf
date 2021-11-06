output "ids" {
  value = module.ec2.*.id
}

output "private_ips" {
  value = module.ec2.*.private_ip
}

output "instance_profile_name" {
  value = module.iam.iam_instance_profile_name
}