module "workload_platform" {
  source = "github.com/thoughtbot/flightdeck//aws/platform?ref=v0.12.1"

  cluster_name = data.aws_eks_cluster.this.name

  admin_roles = [
    data.aws_iam_role.eks["terraform-execution"].arn,
    module.permission_set_roles.by_name_without_path.InfrastructureAdmin
  ]

  # flightdeck-example-production-developer must be replaced with roles to access
  # the cluster based on namespaces you'll be creating later.
  custom_groups = {
    (module.permission_set_roles.by_name_without_path.DeveloperAccess) = [
      "flightdeck-production-developer"
    ]
  }

  domain_names = [
    "__PRODUCTION_DOMAIN_NAME__"
  ]
  prometheus_data_source = module.prometheus.prometheus_data
  flightdeck_prometheus_values = [
    file("${path.module}/../flightdeck-prometheus-values.yaml")
  ]
}

module "permission_set_roles" {
  source = "github.com/thoughtbot/terraform-aws-sso-permission-set-roles.git?ref=v0.3.0"
}

data "aws_eks_cluster" "this" {
  name = "__ORG_NAME__-production-v1"
}

data "aws_eks_cluster_auth" "kubernetes" {
  name = data.aws_eks_cluster.this.name
}

data "aws_iam_role" "eks" {
  for_each = toset([
    "terraform-execution"
  ])

  name = each.value
}

module "prometheus" {
  source = "github.com/thoughtbot/flightdeck//aws/prometheus-data?ref=v0.12.1"

  aws_prometheus_workspace_name = "__ORG_NAME__-production"
}
