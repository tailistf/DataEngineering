resource "aws_glue_job" "glue_job_rais" {
  name     = "glue_job_rais"
  role_arn = aws_iam_role.AWSGlueServiceRole_edc2.arn

  command {
    script_location = "s3://${aws_s3_bucket.datalake.id}/emr-code/pyspark/job_spark_from_tf.py"
  }
}

