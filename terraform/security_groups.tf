# ==========================================
# SECURITY GROUP FOR DOCKER WEB SERVERS
# ==========================================

resource "aws_security_group" "docker_web_sg" {
  name        = "sammy-docker-web-sg"
  description = "Security group for Docker web servers"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "sammy-docker-web-sg"
  }
}

# ==========================================
# ALLOW SSH FROM YOUR PUBLIC IP ONLY
# ==========================================

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.docker_web_sg.id

  cidr_ipv4   = var.ssh_allowed_cidr
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  description = "SSH access from my public IP"
}

# ==========================================
# ALLOW HTTP TRAFFIC
# ==========================================

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.docker_web_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow HTTP traffic"
}

# ==========================================
# ALLOW HTTPS TRAFFIC
# ==========================================

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.docker_web_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  description = "Allow HTTPS traffic"
}

# ==========================================
# ALLOW ALL OUTBOUND TRAFFIC
# ==========================================

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.docker_web_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow outbound internet access"
}
