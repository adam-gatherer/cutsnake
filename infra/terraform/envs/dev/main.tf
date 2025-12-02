locals {
  name_prefix = "${var.project}-${var.env}"
}

module "db" {
  source     = "../../modules/db"
  project    = var.project
  env        = var.env
  aws_region = var.aws_region
}
