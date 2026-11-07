output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "docker_web_1_public_ip" {
  description = "Public IP of Docker web server 1"
  value       = aws_instance.docker_web_1.public_ip
}

output "docker_web_2_public_ip" {
  description = "Public IP of Docker web server 2"
  value       = aws_instance.docker_web_2.public_ip
}

output "docker_web_1_private_ip" {
  description = "Private IP of Docker web server 1"
  value       = aws_instance.docker_web_1.private_ip
}

output "docker_web_2_private_ip" {
  description = "Private IP of Docker web server 2"
  value       = aws_instance.docker_web_2.private_ip
}

output "docker_web_1_instance_id" {
  description = "EC2 instance ID of Docker web server 1"
  value       = aws_instance.docker_web_1.id
}

output "docker_web_2_instance_id" {
  description = "EC2 instance ID of Docker web server 2"
  value       = aws_instance.docker_web_2.id
}
