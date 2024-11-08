module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "${var.name}-eks"
  cluster_version = "1.31"

  # EKS Addons
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access           = true
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    nodes = {
      # with k8s v1.30 and later AL2023 is AMI for EKS managed node groups
      instance_types = ["t3.medium"]

      min_size     = 3
      max_size     = 5
      desired_size = 3
      # desired size only used when it is set (creation or if it is changed)
    }
  }

  tags = local.tags
}

