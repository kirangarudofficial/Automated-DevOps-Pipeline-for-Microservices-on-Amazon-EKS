# eks-cluster.tf: Configures the EKS cluster

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.24"
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids
  node_group_name = "${var.cluster_name}-node-group"
  node_group_subnet_ids = var.subnet_ids

  node_groups = {
    default = {
      desired_capacity = var.desired_size
      max_size         = var.max_size
      min_size         = var.min_size
      instance_type    = var.instance_type
    }
  }

  tags = {
    Name = var.cluster_name
  }
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}
