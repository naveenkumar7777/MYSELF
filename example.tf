provider "aws" {
  region     = "us-east-1"
  access_key = "AKIASSWIRC5DTZM3R4MB"
  secret_key = "6CtS4wIE6CBke2Fv/X7ij08Fg15+ONgJuz3yTnCz"
}

resource "aws_instance" "example" {
    ami = "ami-096fda3c22c1c990a"
    instance_type = "t2.micro"

}
