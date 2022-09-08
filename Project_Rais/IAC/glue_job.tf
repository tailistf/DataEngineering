resource "aws_glue_job" "glue_job_rais" {
  name     = "glue_job_rais"
  glue_version = "AWS Glue 3.0"
  worker_type = "G.1X"
  number_of_workers = 10
  role_arn = "arn:aws:iam::323411527375:role/AWSGlueServiceRole_edc2"


  command {
    script_location = "s3://${aws_s3_bucket.datalake.id}/emr-code/pyspark/job_spark_from_tf.py"
  }

  default_arguments = {
    "--job-language" = "Python 3"
  }

}

resource "aws_glue_trigger" "glue_trigger_rais" {
  name     = "glue_trigger_rais"
  schedule = "cron(0 8 1 9 ? 2022)"
  start_on_creation = true
  type     = "SCHEDULED"

  actions {
    job_name = aws_glue_job.glue_job_rais.name
  }

}
