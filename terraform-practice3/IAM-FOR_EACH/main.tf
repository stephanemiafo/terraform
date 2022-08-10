

resource "aws_iam_user" "my_users" {
    for_each = toset( ["IDRISS", "CLAUDIO", "NARCISSE"] ) 
    name = each.key  # "each" object can be used only in "module" or "resource" blocks, and only when the "for_each" argument is set.
  
}
       
    #  MAP   
    # for_each = {
    #     "user-1" = { name = "IDRISS" }
    #     "user-2" = { name = "CLAUDIO" }
    #     "user-3" = { name = "NARCISSE"}
    #  }
    # name = "${each.value.name}"  

    # variable "name" {
    #     description = "allowed users"
    #     type = map (string)
    #     default = {
    #         user_1 = "IDRISS" 
    #         user_2 = "CLAUDIO" 
    #         user_3 = "NARCISSE"
    #     }    
    # }





   
  
