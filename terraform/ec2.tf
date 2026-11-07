# ==========================================
# FIND LATEST UBUNTU 24.04 LTS AMI
# ==========================================

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
    ]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ==========================================
# EC2 INSTANCE 1
# ==========================================

resource "aws_instance" "docker_web_1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.docker_web_sg.id]
  key_name               = var.key_name

  associate_public_ip_address = true

  root_block_device {
    volume_size = 12
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "sammy-docker-web-1"
    Role = "Docker-Web-Server"
  }
}

# ==========================================
# EC2 INSTANCE 2
# ==========================================

resource "aws_instance" "docker_web_2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_2.id
  vpc_security_group_ids = [aws_security_group.docker_web_sg.id]
  key_name               = var.key_name

  associate_public_ip_address = true

  root_block_device {
    volume_size = 12
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "sammy-docker-web-2"
    Role = "Docker-Web-Server"
  }
}
