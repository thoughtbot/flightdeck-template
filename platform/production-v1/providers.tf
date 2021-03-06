provider "aws" {
  region = "__REGION__"

  assume_role {
    role_arn = "arn:aws:iam::__PRODUCTION_ACCOUNT_ID__:role/__PRODUCTION_EXECUTION_ROLE__"
  }
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.kubernetes.token
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.kubernetes.token
}
