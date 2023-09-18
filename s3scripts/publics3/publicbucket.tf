terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAUMLWS6YI3DOOZZFS"
  secret_key = "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"
}

resource "aws_s3_bucket" "reactappbucket" {
  bucket = "my-tf-reactapp-bucket"
}

resource "aws_s3_bucket_public_access_block" "reactappbucket" {
  bucket = aws_s3_bucket.reactappbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "reactappbucket" {
  bucket = aws_s3_bucket.reactappbucket.id

  index_document {
  suffix = "index.html"
  }

  error_document {
  key = "error.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "reactappbucket" {
  bucket = aws_s3_bucket.reactappbucket.id
  rule {
  object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "reactappbucket" {
  bucket = aws_s3_bucket.reactappbucket.id

  acl = "public-read"
  depends_on = [
  aws_s3_bucket_ownership_controls.reactappbucket,
  aws_s3_bucket_public_access_block.reactappbucket
  ]
}

resource "aws_s3_bucket_policy" "reactappbucket" {
  bucket = aws_s3_bucket.reactappbucket.id

  policy = jsonencode({
  Version = "2012-10-17"
  Statement = [
    {
    Sid       = "PublicReadGetObject"
    Effect    = "Allow"
    Principal = "*"
    Action    = "s3:GetObject"
    Resource = [
      aws_s3_bucket.reactappbucket.arn,
      "${aws_s3_bucket.reactappbucket.arn}/*",
    ]
    },
  ]
  })

  depends_on = [
  aws_s3_bucket_public_access_block.reactappbucket
  ]
}
