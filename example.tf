provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

# Adding VPC
resource "aws_vpc" "naveen_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

#Adding Subnet

resource "aws_subnet" "naveen_vpc_subnet" {
  vpc_id            = aws_vpc.naveen_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-example"
  }
}
#Adding Gateway

resource "aws_internet_gateway" "naveen_gw" {
  vpc_id = aws_vpc.naveen_vpc.id

  tags = {
    Name = "tf-example"
  }
}

# Adding Route_table

resource "aws_route_table" "naveen_rt" {
  vpc_id = aws_vpc.naveen_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.naveen_gw.id
    }

    tags = {
      Name = "tf-exmaple"
    }
  }

# Adding Security_group

  resource "aws_security_group" "naveen_sg" {
    name        = "naveen_sg"
    description = "Allow all inbound/outbound traffic"
    vpc_id      = aws_vpc.naveen_vpc.id

    ingress {
      description = "ALLOW ALL traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "tf-example"
    }
  }


# Adding Aws_instance

resource "aws_instance" "naveen_ec2" {
    ami = "ami-047a51fa27710816e"
    instance_type = "t2.micro"

}
