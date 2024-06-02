terraform {
  backend "s3" {
    bucket         = "s3-backend-for-revhire-infrastructure-creation"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "revhire-backend-table"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name           = "terraform_locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
