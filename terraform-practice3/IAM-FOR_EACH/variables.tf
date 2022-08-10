
variable "aws_region" {
  description = "region where resources will be launched"
  type = string
}

variable "name" {
    description = "allowed users"
    type = set(string)
}    
