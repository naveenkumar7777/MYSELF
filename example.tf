provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "example" {
    ami = "ami-096fda3c22c1c990a"
    instance_type = "t2.micro"

}
resource "aws_vpc" "naveen_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "naveen_vpc_subnet" {
  vpc_id            = aws_vpc.naveen_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-example"
  }
}
