provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "sampleinstance" {
  ami = "ami-019715e0d74f695be"
  instance_type = "t2.nano"
  vpc_security_group_ids = ["sg-0f01a7147cd53b3a5"]
  key_name = "Mrsa"
  availability_zone = "ap-south-1b"

  tags = {
    name = "firsttfinstance"
  }
}