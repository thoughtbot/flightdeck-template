provider "aws" {
  region = "__REGION__"

  assume_role {
    role_arn = "arn:aws:iam::__ACCOUNT_ACCOUNT_ID__:role/__ACCOUNT_EXECUTION_ROLE__"
  }
}
