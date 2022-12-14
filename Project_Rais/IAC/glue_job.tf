resource "aws_glue_job" "glue_job_rais" {
  glue_version = "3.0"
  name     = "glue_job_rais"
  worker_type = "G.1X"
  number_of_workers = 10
  max_retries = 3
  role_arn = "arn:aws:iam::323411527375:role/AWSGlueServiceRole_edc2"


  command {
    script_location = "s3://${aws_s3_bucket.datalake.id}/emr-code/pyspark/job_spark_from_tf.py"
    python_version  = "3"
  }

  default_arguments = {
    "--job-language" = "python"
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
