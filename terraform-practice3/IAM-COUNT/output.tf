

output "arn" {
    value = aws_iam_user.myusers[*].arn
  
}
