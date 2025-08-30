terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Create an S3 bucket (defaults to private)
resource "aws_s3_bucket" "this" {
  bucket        = var.bucket_name
  force_destroy = true   # allows terraform destroy even if the bucket has objects
  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}

# (Good practice) Block all public access
resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
