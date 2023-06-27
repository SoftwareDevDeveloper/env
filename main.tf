module "create_ec2_from_codebase" {
    source = "git::https://github.com/SoftwareDevDeveloper/codebase.git"
    bucket = "var.my_bucket"
    key = "var.my_key"
    sg_name = "var.my_sg_name"
  
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    //bucket = "devops-expert-terraform-state-files"
    //key    = "development/terraform.tfstate"
    bucket = var.bucket
    key = var.key
    region = "eu-west-1"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-1"
}


variable my_key {}
variable my_bucket {}
variable my_sg_name {}
