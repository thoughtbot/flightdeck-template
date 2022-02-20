provider "aws" {
  region = "__REGION__"

  assume_role {
    role_arn = "arn:aws:iam::__ACCOUNT_ID__:role/terraform-execution"
  }
}
