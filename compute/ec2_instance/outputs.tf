output "public_instance_ids" {
  value = aws_instance.public_instances[*].id
}

output "private_instance_ids" {
  value = aws_instance.private_instances[*].id
}
