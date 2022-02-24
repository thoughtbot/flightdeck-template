module "ingress" {
  providers = { aws.cluster = aws, aws.route53 = aws }
  source    = "github.com/thoughtbot/flightdeck//aws/ingress?ref=v0.5.0"

  hosted_zone_name    = "__SANDBOX_HOSTED_ZONE__"
  name                = "__ORG_NAME__-sandbox"
  network_tags        = { "kubernetes.io/cluster/__ORG_NAME__-sandbox-v1" = "shared" }
  primary_domain_name = "__SANDBOX_DOMAIN_NAME__"
}
