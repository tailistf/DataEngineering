resource "aws_glue_job" "glue_job_rais" {
  name     = "glue_job_rais"
  role_arn = "arn:aws:iam::323411527375:role/AWSGlueServiceRole_edc2"

  command {
    script_location = "s3://${aws_s3_bucket.datalake.id}/emr-code/pyspark/job_spark_from_tf.py"
  }
}

resource "aws_glue_trigger" "glue_trigger_rais" {
  name     = "glue_trigger_rais"
  schedule = "cron(0 8 1 9 ? 2022)"
  StartOnCreation = true
  type     = "SCHEDULED"

  actions {
    job_name = aws_glue_job.glue_job_rais.name
  }
}
