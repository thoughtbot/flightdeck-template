module "network" {
  source = "github.com/thoughtbot/flightdeck//aws/network?ref=v0.9.0"

  cluster_names          = ["__ORG_NAME__-sandbox-v1"]
  name                   = "__ORG_NAME__-sandbox"
  nat_availability_zones = ["__REGION__a"]
  vpc_cidr_block         = "10.16.0.0/16"

  private_subnet_cidr_blocks = {
    "__REGION__a" = "10.16.64.0/18"
    "__REGION__b" = "10.16.128.0/18"
  }

  public_subnet_cidr_blocks = {
    "__REGION__a" = "10.16.0.0/20"
    "__REGION__b" = "10.16.16.0/20"
  }
}
