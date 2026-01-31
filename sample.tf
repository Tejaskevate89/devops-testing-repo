locals {
  instance_name = "my_firstinstance"
}



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
  vpc_security_group_ids = data.aws_security_groups.launch-wizard-1.ids
  key_name = "Mrsa"
  availability_zone = "ap-south-1b"

  tags = {
    name = local.instance_name
  }
}

data "aws_security_groups" "launch-wizard-1" {
  filter {
    name = "vpc-id"
    values = [var.vpc_id]
  }
  filter {
    name = "group-name"
    values = ["launch-wizard-1"]
  }
}

variable "vpc_id" {
  default = "vpc-038a56f95e3f8a2de"
}
variable "ami_id" {
  default = "ami-019715e0d74f695be"
}
variable "instance_type" {
  default = "t2.nano"
}

output "instance_ip" {
  value = aws_instance.sampleinstance.public_ip
}
output "instance_id" {
  value = aws_instance.sampleinstance.id
}

