terraform {
  backend "s3" {
    bucket         = "__SANDBOX_STATE_BUCKET__"
    dynamodb_table = "__SANDBOX_STATE_TABLE__"
    encrypt        = true
    key            = "__STATE_PREFIX__cluster/sandbox-v1/terraform.tfstate"
    kms_key_id     = "arn:aws:kms:__REGION__:__SANDBOX_ACCOUNT_ID__:alias/__SANDBOX_KMS_KEY_NAME__"
    region         = "__REGION__"
    role_arn       = "arn:aws:iam::__SANDBOX_ACCOUNT_ID__:role/terraform-state-__SANDBOX_ACCOUNT_ID__"
  }
}
