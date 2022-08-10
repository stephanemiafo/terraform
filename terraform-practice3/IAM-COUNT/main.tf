

# CREATE 3 USEURS USING THE COUNT ARGUMENT.

resource "aws_iam_user" "myusers" {
  count = 3                             # NUMBER OF IAM USERS
  name  = var.aws_iam_user[count.index] #NAME OF USERS IN ORDER AFTER CREATION
  tags = {
    Name = "${var.aws_iam_user[count.index]}" # ${name} in ligne 6 meaning referencing ligne 6 to tag
  }
}




