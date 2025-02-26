module "cluster" {
  source = "github.com/thoughtbot/flightdeck//aws/cluster?ref=v0.12.1"

  name        = "__ORG_NAME__-production-v1"
  k8s_version                                = "1.31"
  auth_mode                                  = "CONFIG_MAP"
  bootstrap_cluster_creator_admin_permission = true

  node_groups = {
    m6i = {
      instance_types = ["m6i.large"]
      max_size       = 10
      min_size       = 2
    }
  }
}
