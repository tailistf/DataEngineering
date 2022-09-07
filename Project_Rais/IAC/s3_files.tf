resource "aws_s3_object" "code_spark" {
   bucket = aws_s3_bucket.datalake.id
   key = "emr-code/pyspark/job_spark_from_tf.py"
   acl="private"
   source= "../codes/job_spark.py"
   etag=filemd5("../codes/job_spark.py") 
}
