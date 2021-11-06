output "id" {
  value = module.ec2.id
}

output "instance_profile_name" {
  value = module.iam.iam_instance_profile_name
}

output "sg_id" {
  value = module.http.security_group_id
}

output "private_id" {
  value = module.ec2.private_ip
}