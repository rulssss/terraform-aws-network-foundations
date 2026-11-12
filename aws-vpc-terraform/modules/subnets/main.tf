data "aws_availability_zones" "available" {
  state = "available"
}

# Public

resource "aws_subnet" "public_1" {
    vpc_id = var.vpc_id
    cidr_block = var.public_subnet_1
    map_public_ip_on_launch = true
    availability_zone       = data.aws_availability_zones.available.names[0]

    tags = {
        Name = "${var.project}-public-1"
    }
}

resource "aws_subnet" "public_2" {
    vpc_id = var.vpc_id
    cidr_block = var.public_subnet_2
    map_public_ip_on_launch = true
    availability_zone       = data.aws_availability_zones.available.names[1]

    tags = {
        Name = "${var.project}-public-2"
    }
}

# Private

resource "aws_subnet" "private_1" {
    vpc_id = var.vpc_id
    cidr_block = var.private_subnet_1
    availability_zone       = data.aws_availability_zones.available.names[0]

    tags = {
        Name = "${var.project}-private-1"
    }
}

resource "aws_subnet" "private_2" {
    vpc_id = var.vpc_id
    cidr_block = var.private_subnet_2
    availability_zone       = data.aws_availability_zones.available.names[1]

    tags = {
        Name = "${var.project}-private-2"
    }
}
