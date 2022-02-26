provider "aws" {
  region = "__REGION__"

  assume_role {
    role_arn = "arn:aws:iam::__SANDBOX_ACCOUNT_ID__:role/__SANDBOX_EXECUTION_ROLE__"
  }
}
