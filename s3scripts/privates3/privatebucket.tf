terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "djtfprivatebucket2023" {
  bucket = "djtfprivatebucket2023"
  acl    = "private"

  versioning {
    enabled = true
  }
}
