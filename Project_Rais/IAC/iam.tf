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

resource "aws_iam_policy" "lambda" {
 name = "LambdaBasicExecutionRolePolicy_"
 path = "/"
 description = "Provides write permissions to CloudWatch Logs, S3 buckets and EMR Steps"

 policy = <<EOF
 {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action":[
                "elasticmapreduce:*"   
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_attach" {
    role = aws_iam_role.lambda.name
    policy_arn = aws_iam_policy.lambda.arn
}