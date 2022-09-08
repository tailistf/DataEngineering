resource "aws_glue_crawler" "glue_crawler_rais" {
  database_name = "datalake"
  name          = "glue_crawler_consumerzone_rais"
  role          = "AWSGlueServiceRole-crawler_edc"

  s3_target {
    path = "s3://datalake-engenharia-dados/consumer-zone/rais"
  }
}
