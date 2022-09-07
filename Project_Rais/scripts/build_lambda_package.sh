### Script by framework Rony
cd ../IAC

#Declare variable to reuse during directory validations 
PACKAGE="package"

#Create directory and install fucntion dependencies 
if [ -d $PACKAGE]
then 
   echo "The Directory: "$PACKAGE" already exits"
else
   echo "==========================================="
   echo "Criando o diretório "$PACKAGE"..."
   mkdir $PACKAGE
   echo "The directory: "$PACKAGE" was created"  
   echo "==========================================="
fi

#Declare variable that localize the requirements with dependencies from project
FILE_REQUIREMENTS=../etl/lambda_requirements.txt
echo "FILE_REQUIREMENTS: "$FILE_REQUIREMENTS"" 
#Check if file lambda_requirements exists
if [ -f $FILE_REQUIREMENTS]
then 
   echo "==========================================="
   echo "Instaling dependencies from "$FILE_REQUIREMENTS""
   pip install --target ./package -  $FILE_REQUIREMENTS
   echo "Dependencies installed with success"
   echo "==========================================="
fi

echo "PACKAGE: "$PACKAGE"" 
cd $PACKAGE

#Declare variable to localize lanbda function to reuse the code .
LAMBDA_FUNCTION=../../etl/lambda_function.py
echo "LAMBDA_FUNCTION: "$LAMBDA_FUNCTION""

#Check if file lambda_function exists
if [ -f $LAMBDA_FUNCTION]
then 
   echo "==========================================="
   echo "Coping  Handler function..."
   cp $LAMBDA_FUNCTION .
   echo "Zip file lambda_function_paylod.zip"
   zip -r9 ../lambda_function_paylod.zip .
   echo "File zipped with success"
   echo "==========================================="
fi

cd ../