

output "IDRISS-arn" {
    value = aws_iam_user.my_users["IDRISS"].arn  
}
    
   output "CLAUDIO-arn" {
    value = aws_iam_user.my_users["CLAUDIO"].arn  
}
   
output "NARCISSE-arn" {
    value = aws_iam_user.my_users["NARCISSE"].arn  
}