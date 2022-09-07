import boto3
import os, os.path
from datetime import datetime


year= '2020'
unzip_path =f'\\..\\data\\year{year}\\unzipped'
s3_client = boto3.client('s3', 'us-east-2')

print(unzip_path)

#s3_client.upload_file("D:\\bootcamp_edc\Projeto_DadosEnem\Microdados_2020\dados\DADOS\ITENS_PROVA_2020.csv", 
#                       "datalake-engenharia-dados",
#                       "raw-data/enem/ano=2020/ITENS_PROVA_2020.csv")


for p, _, files in os.walk(os.path.abspath(unzip_path)):
   print(f'##### Upload to S3 Started: {datetime.now().strftime("%d/%m/%Y %H:%M")} #####') 
   for file in files:
    file_path=os.path.join(p, file)
    print(f'Uploading file {file_path} ...')
    s3_client.upload_file(f"{unzip_path}\{file}", 
                           "datalake-engenharia-dados",
                          f"raw-data/rais/ano={year}/{file}")
    print(f'##### Upload to S3 Finished:  {datetime.now().strftime("%d/%m/%Y %H:%M")} #####')



