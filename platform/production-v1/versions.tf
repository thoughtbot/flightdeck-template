terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws        = { version = "~> 4.0" }
    helm       = { version = "~> 2.1" }
    kubernetes = { version = "~> 2.2" }
  }
}
