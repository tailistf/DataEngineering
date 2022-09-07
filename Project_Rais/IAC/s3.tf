resource "aws_s3_bucket" "datalake"{
    bucket= var.base_bucket_name
}

resource "aws_s3_bucket_acl" "aws_bucket_acl" {
  bucket = aws_s3_bucket.datalake.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aws_config"{
    bucket = aws_s3_bucket.datalake.bucket
    rule{
           apply_server_side_encryption_by_default {
            sse_algorithm="AES256"
            }
        }
    }


   