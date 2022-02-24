terraform {
  backend "s3" {
    bucket         = "terraform-state-__PRODUCTION_ACCOUNT_ID__"
    dynamodb_table = "terraform-state-__PRODUCTION_ACCOUNT_ID__"
    encrypt        = true
    key            = "__STATE_PREFIX__network/production/terraform.tfstate"
    kms_key_id     = "arn:aws:kms:__REGION__:__PRODUCTION_ACCOUNT_ID__:alias/terraform-state-__PRODUCTION_ACCOUNT_ID__"
    region         = "__REGION__"
    role_arn       = "arn:aws:iam::__PRODUCTION_ACCOUNT_ID__:role/terraform-state-__PRODUCTION_ACCOUNT_ID__"
  }
}
