module "ingress" {
  providers = { aws.cluster = aws, aws.route53 = aws }
  source    = "git@github.com:thoughtbot/flightdeck.git//aws/ingress?ref=v0.5.0"

  hosted_zone_name    = "example.com"
  name                = "__ORG_NAME__-production"
  network_tags        = { "kubernetes.io/cluster/__ORG_NAME__-production-v1" = "shared" }
  primary_domain_name = "example.com"
}
