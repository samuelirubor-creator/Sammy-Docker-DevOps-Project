# ==========================================
# 1. CREATE VPC
# ==========================================

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "sammy-docker-vpc"
  }
}

# ==========================================
# 2. CREATE INTERNET GATEWAY
# ==========================================

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "sammy-docker-igw"
  }
}

# ==========================================
# 3. CREATE PUBLIC SUBNET 1
# ==========================================

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "sammy-docker-public-subnet-1"
  }
}

# ==========================================
# 4. CREATE PUBLIC SUBNET 2
# ==========================================

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "sammy-docker-public-subnet-2"
  }
}

# ==========================================
# 5. CREATE PUBLIC ROUTE TABLE
# ==========================================

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "sammy-docker-public-rt"
  }
}

# ==========================================
# 6. ROUTE INTERNET TRAFFIC TO IGW
# ==========================================

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

# ==========================================
# 7. ASSOCIATE PUBLIC SUBNET 1
# ==========================================

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

# ==========================================
# 8. ASSOCIATE PUBLIC SUBNET 2
# ==========================================

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}
