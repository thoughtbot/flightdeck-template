terraform {
  backend "s3" {
    bucket         = "terraform-state-__ACCOUNT_ID__"
    dynamodb_table = "terraform-state-__ACCOUNT_ID__"
    encrypt        = true
    key            = "__MODULE__/terraform.tfstate"
    kms_key_id     = "arn:aws:kms:__REGION__:__ACCOUNT_ID__:alias/terraform-state-__ACCOUNT_ID__"
    region         = "__REGION__"
    role_arn       = "arn:aws:iam::__ACCOUNT_ID__:role/terraform-state-__ACCOUNT_ID__"
  }
}
