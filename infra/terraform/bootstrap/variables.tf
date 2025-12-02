variable "aws_region" {
  description = "AWS region to deploy bootstrap resources"
  type        = string
  default     = "eu-west-1"
}

variable "project" {
  description = "Project name prefix"
  type        = string
  default     = "cutsnake"
}

variable "env" {
  description = "Environment (used for naming only here)"
  type        = string
  default     = "global"
}

variable "state_bucket_name" {
  description = "Existing S3 bucket name for Terraform state"
  type        = string
  default     = "terrified-banana-tf-states"
}