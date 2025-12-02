# module specific var
locals {
  name_prefix = "${var.project}-${var.env}"
}

# create dynamodb table
resource "aws_dynamodb_table" "links" {
  name         = "${local.name_prefix}-links"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "pk"
  range_key    = "sk"

  attribute {
    name = "pk"
    type = "S"
  }

  attribute {
    name = "sk"
    type = "S"
  }

  ttl {
    attribute_name = "ttl"
    enabled        = true
  }

  tags = {
    Project = var.project
    Env     = var.env
  }
}


# analytics table
resource "aws_dynamodb_table" "analytics" {
  name         = "${local.name_prefix}-analytics"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "pk"
  range_key    = "sk"

  attribute {
    name = "pk"
    type = "S"
  }

  attribute {
    name = "sk"
    type = "S"
  }

  tags = {
    Project = var.project
    Env     = var.env
  }
}

output "links_table_name" {
  value = aws_dynamodb_table.links.name
}

output "analytics_table_name" {
  value = aws_dynamodb_table.analytics.name
}
