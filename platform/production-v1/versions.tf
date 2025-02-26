terraform {
  required_version = ">= __TERRAFORM_VERSION__"

  required_providers {
    aws        = { version = "~> __AWS_PROVIDER_VERSION__" }
    helm       = { version = "~> __HELM_PROVIDER_VERSION__" }
    kubernetes = { version = "~> __KUBERNETES_PROVIDER_VERSION__" }
  }
}
