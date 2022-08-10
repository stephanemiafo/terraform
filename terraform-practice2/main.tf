
data "aws_ami" "linux" {
    most_recent = true  # fetch the most recent ami
    owners =  ["137112412989"]  # account number of the owner of the ami. On the ec2 console click AMI under image section and search your ami id in public images.
    filter {
      name = "name"
      values = ["amzn2-ami-kernel-5.10-hvm-2.0.*.1-x86_64-gp2"] # filter by ami name
    }
}

data "aws_region" "current" {}

data "aws_availability_zone" "example" {
  name = var.aws_AZ
 
}

# CREATE A LINUX2 INTANCE
resource "aws_instance" "linux_server" {
  ami = data.aws_ami.linux.id # REFERENCE THE DATA SOURCE
  instance_type = var.instance_type ["dev"]  #REFERENCE THE VALUE OF THE VARIABLE SPECIFIED
  availability_zone = data.aws_availability_zone.example.name #data.aws_availability_zone.example.name_suffix) # REFERENCE THE VALUE OF THE VARIABLE SPECIFIED
  key_name = var.key_name #REFERENCE THE VALUE OF THE VARIABLE SPECIFIED
  disable_api_termination = var.termination # THIS IS USED IN PROD IN ORDER TO PROTECT THE SERVER FROM BEING ACCIDENTALLY DESTROY BY TERRAFORM. THE EC2 HAS TO BE TERMINATED MANUALLY ON THE CONSOLE.
  vpc_security_group_ids = [aws_security_group.linux_server_SG.id]  # REFERENCE A RESOURCE
  tags = var.instance_tags
}
  

resource "aws_vpc" "Test_vpc" {
  cidr_block = var.vpc_cidr
  tags = var.vpc_tag
}

resource "aws_security_group" "linux_server_SG" {
  name        = var.SG_name
  description = var.SG_description
 
  ingress {
    description      = var.ssh_description
    from_port        = var.port_ssh
    to_port          = var.port_ssh
    protocol         = var.protocol
    cidr_blocks      =[var.cidr_ssh]
  }

  ingress {
    description      = var.http_description
    from_port        = var.http_port
    to_port          = var.http_port
    protocol         = var.protocol
    cidr_blocks     = [var.cidr_http]
  }
  ingress {
    description      = var.db_description
    from_port        = var.database_port
    to_port          = var.database_port
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_db]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = var.SG_tags
}

