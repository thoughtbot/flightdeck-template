module "ingress" {
  providers = { aws.cluster = aws, aws.route53 = aws }
  source    = "github.com/thoughtbot/flightdeck//aws/ingress?ref=v0.9.0"

  cluster_names       = ["__ORG_NAME__-production-v1"]
  hosted_zone_name    = "__PRODUCTION_HOSTED_ZONE__"
  name                = "__ORG_NAME__-production"
  network_tags        = { "kubernetes.io/cluster/__ORG_NAME__-production-v1" = "shared" }
  primary_domain_name = "__PRODUCTION_DOMAIN_NAME__"

  # Uncomment to disable creation of Route 53 aliases
  # create_aliases = false

  # Uncomment to disable creation ACM certificates
  # issue_certificates = false

  # Uncomment to lookup an existing ACM certificate using a different domain
  # certificate_domain_name = "__PRODUCTION_CERTIFICATE_DOMAIN_NAME__"
}
