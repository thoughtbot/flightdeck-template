module "network" {
  source = "github.com/thoughtbot/flightdeck//aws/network?ref=v0.12.1"

  cluster_names          = ["__ORG_NAME__-production-v1"]
  name                   = "__ORG_NAME__-production"
  nat_availability_zones = ["__REGION__a", "__REGION__b"]
  vpc_cidr_block         = "10.32.0.0/16"

  private_subnet_cidr_blocks = {
    "__REGION__a" = "10.32.64.0/18"
    "__REGION__b" = "10.32.128.0/18"
  }

  public_subnet_cidr_blocks = {
    "__REGION__a" = "10.32.0.0/20"
    "__REGION__b" = "10.32.16.0/20"
  }
}
