terraform {
  backend "s3" {
    bucket         = "__PRODUCTION_STATE_BUCKET__"
    dynamodb_table = "__PRODUCTION_STATE_TABLE__"
    encrypt        = true
    key            = "__STATE_PREFIX__cluster/production-v1/terraform.tfstate"
    kms_key_id     = "arn:aws:kms:__REGION__:__PRODUCTION_ACCOUNT_ID__:alias/__PRODUCTION_STATE_KMS_KEY__"
    region         = "__REGION__"
    role_arn       = "arn:aws:iam::__PRODUCTION_ACCOUNT_ID__:role/__PRODUCTION_STATE_ROLE__"
  }
}
