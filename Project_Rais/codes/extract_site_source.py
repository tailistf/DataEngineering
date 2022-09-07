from ftplib import FTP
import os, os.path
import py7zr



# link sobre :
# bilioteca ftplib: https://docs.python.org/3/library/ftplib.html
year = '2020'
host_name  = (f'ftp.mtps.gov.br')
host_path  = (f'/pdet/microdados/RAIS/{year}/')
zip_path   = f'\\..\\data\\year{year}\\zipped'
unzip_path = f'\\..\\data\\year{year}\\unzipped'

#conexão anonima - user e password não declarados, site governamental 
ftp_server = FTP(host_name, 'anonymous', 'anonymous@mtps.gov.br')

#define caminho na conexao ftp
ftp_server.cwd(host_path)
ftp_server.cwd(f'/pdet/microdados/RAIS/{year}/')

#definindo o formato para nome de pastas e arquivos
ftp_server.encoding = "utf-8"


# lista de nome dos arquivos
filenames = ftp_server.nlst() # get filenames within the directory

# Percorrendo lista para download de cada arquivo do diretorio
print('#### Download Started #####')
for filename in filenames:
    print(f'filename downloading...{filename}\n')
    local_filename = os.path.join(zip_path, filename)
    file = open(local_filename, 'wb')
    ftp_server.retrbinary('RETR '+ filename, file.write)   
    file.close()
print('#### Download  Finished #####')
#fechando conexao ftp
ftp_server.quit() # This is the “polite” way to close a connection


#descompactando os arquivos
print(f'##### Extract Started #####')
for p, _, files in os.walk(os.path.abspath(zip_path)):
   for file in files:
    file_path=os.path.join(p, file)
    print(f'Extracting file {file_path} ...')
    with py7zr.SevenZipFile(file_path, mode='r') as uzf:
      uzf.extractall(unzip_path)
print(f'##### Extract Finished #####')
