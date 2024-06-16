module "eks_prerequisites" {
  source = "./eks_dependencies"
}

output "eks_prerequisites" {
  value = module.eks_prerequisites
}

module "eks" {
  source = "./eks_cluster"

  cluster_name = "cdcd_demo_eks"
  cluster_version = "1.29"

  vpc_id = module.eks_prerequisites.vpc_id
  subnet_ids = module.eks_prerequisites.private_subnets
  control_plane_subnet_ids = module.eks_prerequisites.private_subnets

  eks_managed_node_group_default_instance_types = ["t3.small", "t4g.small"]

}

output "eks_output" {
  value = module.eks
}