terraform {
  backend "s3" {
    bucket         = "terraform-state-__SANDBOX_ACCOUNT_ID__"
    dynamodb_table = "terraform-state-__SANDBOX_ACCOUNT_ID__"
    encrypt        = true
    key            = "network/sandbox/terraform.tfstate"
    kms_key_id     = "arn:aws:kms:__REGION__:__SANDBOX_ACCOUNT_ID__:alias/terraform-state-__SANDBOX_ACCOUNT_ID__"
    region         = "__REGION__"
    role_arn       = "arn:aws:iam::__SANDBOX_ACCOUNT_ID__:role/terraform-state-__SANDBOX_ACCOUNT_ID__"
  }
}
