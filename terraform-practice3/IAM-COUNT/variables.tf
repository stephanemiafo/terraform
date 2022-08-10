
variable "aws_region" {
  description = "region where resources will be launched"
  type        = string
  
}

variable "aws_iam_user" {
  description  = "allowed iam users"
  type         = list(string) #MADE THIS CHOICE TO ALLOW THE "count-argument" TO LIST THEM IN ORDER USING THEIR INDEX.
 
}
