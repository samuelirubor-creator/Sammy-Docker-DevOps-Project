# AWS Region
variable "aws_region" {
  description = "AWS region for our infrastructure"
  type        = string
  default     = "us-east-1"
}

# VPC CIDR
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# First Public Subnet
variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

# Second Public Subnet
variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

# EC2 Instance Type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# Number of EC2 Instances
variable "instance_count" {
  description = "Number of Docker web servers"
  type        = number
  default     = 2

  validation {
    condition     = var.instance_count == 2
    error_message = "This lab requires exactly two EC2 instances."
  }
}

# SSH Key Pair
variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}

# SSH Allowed IP
variable "ssh_allowed_cidr" {
  description = "Your public IP address in CIDR format"
  type        = string

  validation {
    condition     = can(cidrhost(var.ssh_allowed_cidr, 0)) && endswith(var.ssh_allowed_cidr, "/32")
    error_message = "Enter a valid single-host IPv4 CIDR ending in /32."
  }
}
