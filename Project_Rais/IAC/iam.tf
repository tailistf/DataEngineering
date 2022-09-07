resource "aws_iam_role" "lambda" {
    name = "lambdarole"

    assume_role_policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": 
       [
         {
          "Action": "sts:AssumeRole",
          "Effect": "Allow",
          "Sid": "AssumeRole",
          "Principal": {
               "Service": "lambda.amazonaws.com"}
         }     
       ]
     }
 EOF
}