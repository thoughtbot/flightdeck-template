module "network" {
  source = "github.com/thoughtbot/flightdeck//aws/network?ref=v0.5.0"

  cluster_names          = ["__ORG_NAME__-production-v1"]
  name                   = "__ORG_NAME__-production"
  nat_availability_zones = ["__REGION__a", "__REGION__b"]
  vpc_cidr_block         = "10.100.0.0/16"

  private_subnet_cidr_blocks = {
    "__REGION__a" = "10.100.64.0/18"
    "__REGION__b" = "10.100.128.0/18"
  }

  public_subnet_cidr_blocks = {
    "__REGION__a" = "10.100.0.0/20"
    "__REGION__b" = "10.100.16.0/20"
  }
}
