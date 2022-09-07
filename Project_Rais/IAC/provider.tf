provider "aws" {
    region=var.aws_region
}

# center control file from terraform 
terraform{
    backend "s3" {
        bucket="terraform-state-engenharia-dados"
        key="state/engenharia-dados/mod1/terraform.state"
        region="us-east-2"
    }
}