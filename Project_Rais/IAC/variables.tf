variable "aws_region" {
    default = "us-east-2"
}

variable "base_bucket_name" {
  default="datalake-ed-code-tf"
  }

  variable "environment" {
    default = "PROD"
  }

  variable "account_number" {
    default = 323411527375
  }


  variable "lambda_function_name" {
    default = "ExecuteEMR"
  }
