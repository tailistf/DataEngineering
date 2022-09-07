
from pyspark.sql.functions import mean, max, min, col,count
from pypark.sql import SparkSession

spark=(
     SparkSession.builder.appName('Spark_Rais')
     .getOrCreate()
)



enem = (
       spark
       .read
       .format("txt")
       .option("header",True)
       .option("inferSchema", True)
       .option("delimiter", ";")
       .load("s3://datalake-engenharia-dados/raw-data/rais")
)


# (
#        enem
#        .write
#        .mode("overwrite")
#        .format("parquet")
#        .partitionBy("ano")
#        .save("s3://datalake-engenharia-dados/consumer-zone/rais")
# )