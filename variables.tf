variable "aws_region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "ap-southeast-2" # Sydney (fits your timezone)
}

variable "bucket_name" {
  description = "Globally-unique S3 bucket name (lowercase, 3-63 chars)"
  type        = string
}
