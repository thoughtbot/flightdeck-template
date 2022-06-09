module "workload_platform" {
  source = "github.com/thoughtbot/flightdeck//aws/platform?ref=v0.6.0"

  cluster_name = data.aws_eks_cluster.this.name

  admin_roles = [
    "arn:aws:iam::__PRODUCTION_ACCOUNT_ID__:role/__PRODUCTION_EXECUTION_ROLE__",
  ]

  domain_names = ["__PRODUCTION_DOMAIN_NAME__"]
}

data "aws_eks_cluster" "this" {
  name = "__ORG_NAME__-production-v1"
}

data "aws_eks_cluster_auth" "kubernetes" {
  name = data.aws_eks_cluster.this.name
}
