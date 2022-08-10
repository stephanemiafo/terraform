locals {
  EC2_common_tags = {
    Name = "linux_server-${var.aws_region}-${var.aws_env ["0"]}" # ENV IS A LIST OF STRING. For MAP OF STRING ${var.aws_env ["Braining"]}
    Region = "${var.aws_region}"
    AZ = "${var.aws_region}b"
    Managed_By = "Terraform"
  }
  
}
