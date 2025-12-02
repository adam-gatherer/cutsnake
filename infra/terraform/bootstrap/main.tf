locals {
  name_prefix = "${var.project}-${var.env}"
}

# verifies bucket exists, throws error if not
data "aws_s3_bucket" "tf_state" {
  bucket = var.state_bucket_name
}

# dynamodb table for state locking
resource "aws_dynamodb_table" "tf_lock" {
  name         = "${local.name_prefix}-tf-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Project = var.project
    Env     = var.env
  }
}

output "tf_state_bucket" {
  description = "S3 bucket for Terraform states"
  value       = var.state_bucket_name
}

output "tf_lock_table" {
  description = "DynamoDB table for Terraform state locking"
  value       = aws_dynamodb_table.tf_lock.name
}