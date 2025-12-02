variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "project" {
  description = "Project name prefix"
  type        = string
  default     = "cutsnake"
}

variable "env" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
