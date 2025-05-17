module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "bank-cluster"
  cluster_version = "1.31"


  cluster_endpoint_public_access  = false
  cluster_endpoint_private_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = var.vpc_id
  subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]

  tags = {
    Environment = "bank"
    Terraform   = "true"
  }
}

resource "aws_security_group_rule" "eks_https_from_vpc" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"]
  security_group_id = module.eks.cluster_security_group_id
  description       = "Allow EKS API (HTTPS) access from within VPC"
}