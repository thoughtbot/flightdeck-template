module "cluster" {
  source = "github.com/thoughtbot/flightdeck//aws/cluster?ref=v0.12.1"

  name        = "__ORG_NAME__-sandbox-v1"
  k8s_version = "1.24"

  node_groups = {
    t3large = {
      instance_types = ["t3.large"]
      max_size       = 10
      min_size       = 2
    }
  }
}
