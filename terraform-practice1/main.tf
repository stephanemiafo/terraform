

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  profile = "tf-cli-west2"
}

resource "aws_instance" "linux_server" {
  ami = "ami-0ca285d4c2cda3300"
  instance_type = "t2.micro"
  availability_zone = "us-west-2b"
  key_name = "terraform-key-pair" 
  security_groups = [ "linux_server_SG" ]

  tags = {
    Name = "Linux_server"  
  }
}
resource "aws_vpc" "Test_vpc" {
  cidr_block = "10.123.0.0/16"

  tags = {
    Name = "Test_VPC"
  }
}

resource "aws_security_group" "linux_server_SG" {
  name        = "linux_server_SG"
  description = "Allow many inbound traffic"

  ingress {
    description      = "allow ssh traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #This is just for testing purpose
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  tags = {
    name = "linux_server_SG"
  }
}