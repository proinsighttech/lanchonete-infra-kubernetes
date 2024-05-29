resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = var.availability_zones[0]

  tags = {
    "Name"                                      = "private-${var.availability_zones[0]}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = var.availability_zones[1]

  tags = {
    "Name"                                     = "private-${var.availability_zones[1]}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-${var.availability_zones[0]}"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-${var.availability_zones[1]}"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}
