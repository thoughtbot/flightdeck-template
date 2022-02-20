module "ingress" {
  providers = { aws.cluster = aws, aws.route53 = aws }
  source    = "git@github.com:thoughtbot/flightdeck.git//aws/ingress?ref=v0.5.0"

  hosted_zone_name    = "sandbox.example.com"
  name                = "__ORG_NAME__-sandbox"
  network_tags        = { "kubernetes.io/cluster/__ORG_NAME__-sandbox-v1" = "shared" }
  primary_domain_name = "sandbox.example.com"
}
