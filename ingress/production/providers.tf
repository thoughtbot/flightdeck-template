provider "aws" {
  region = "__REGION__"

  assume_role {
    role_arn = "arn:aws:iam::__PRODUCTION_ACCOUNT_ID__:role/terraform-execution"
  }
}
