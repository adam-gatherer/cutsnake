terraform {

  # use s3 and dynamo to store tf state files
  backend "s3" {
    bucket         = "terrified-banana-tf-states"
    key            = "cutsnake/dev/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "cutsnake-global-tf-locks"
    encrypt        = true
  }
}
