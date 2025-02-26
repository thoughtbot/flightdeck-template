module "workload_platform" {
  source = "github.com/thoughtbot/flightdeck//aws/platform?ref=v0.12.1"

  cluster_name = data.aws_eks_cluster.this.name

  admin_roles = [
    data.aws_iam_role.eks["terraform-execution"].arn,
    module.permission_set_roles.by_name_without_path.InfrastructureAdmin
  ]

  custom_roles = {
    developer = module.permission_set_roles.by_name_without_path.DeveloperAccess
  }

  domain_names = [
    "__PRODUCTION_DOMAIN_NAME__"
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
