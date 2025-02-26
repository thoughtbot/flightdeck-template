module "ingress" {
  source    = "github.com/thoughtbot/terraform-alb-ingress?ref=v0.7.0"
  providers = { aws.alb = aws, aws.route53 = aws }

  description   = "Flightdeck production load balancer"
  name          = "__ORG_NAME__-production"
  subnet_ids    = module.target_groups.subnet_ids
  target_groups = module.target_groups.by_cluster
  vpc_id        = module.target_groups.vpc_id

  # Choose the domain name of the primary certificate of the HTTPS listener
  primary_certificate_domain = "__PRODUCTION_HOSTED_ZONE__"

  # Create and validate ACM certificates
  issue_certificate_domains = ["__PRODUCTION_HOSTED_ZONE__"]
  validate_certificates     = true

  # Attach ACM certificates created outside the module
  attach_certificate_domains = []

  # Create aliases
  create_domain_aliases = ["__PRODUCTION_HOSTED_ZONE__"]

  # Choose a Route 53 zone for aliases and certificate validation
  hosted_zone_name = "__PRODUCTION_HOSTED_ZONE__"

}

module "target_groups" {
  source = "github.com/thoughtbot/flightdeck//aws/target-groups?ref=v0.12.1"

  cluster_names = [data.aws_eks_cluster.production_v1.name]
}

data "aws_eks_cluster" "production_v1" {
  name = "__ORG_NAME__-production-v1"
}
