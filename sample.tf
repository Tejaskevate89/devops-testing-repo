terraform {
  backend "s3" {
    bucket = "tf-test-bucket-198"
    region = "ap-south-1"
    key = "tfstate-file"
  }
}



provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "sampleinstance" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["sg-0f01a7147cd53b3a5"]
  key_name = "Mrsa"
  availability_zone = "ap-south-1b"

  tags = {
    name = "firsttfinstance"
  }
}

variable "ami_id" {
  default = "ami-019715e0d74f695be"
}
variable "instance_type" {
  default = "t2.nano"
}

output "instance_id" {
  value = aws_instance.sampleinstance.public_ip
  value = aws_instance.sampleinstance.instance_id
}
output "instance_id" {
  value = aws_instance.sampleinstance.id
}

