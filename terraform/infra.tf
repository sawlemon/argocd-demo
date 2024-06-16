module "eks_prerequisites" {
  source = "./eks_dependencies"

  providers = {
    aws = aws
  }

  vpc_name = "my-eks-vpc"
  vpc_cidr = "10.0.0.0/16"

  availability_zones = ["us-east-1a"]
  private_subnets    = ["10.0.1.0/24"]
  public_subnets     = ["10.0.3.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  vpc_tags = {
    Name         = "cicd-demo-vpc"
    managed_by   = "Terraform"
    created_by   = "sawlemon"
    pupose       = "handson"
  }
}

output "eks_prerequisites" {
  value = module.eks_prerequisites
}

module "eks" {
  source = "./eks_cluster"

  providers = {
    aws = aws
  }

  cluster_name = "cdcd_demo_eks"
  cluster_version = "1.29"

  vpc_id = module.eks_prerequisites.vpc_id
  subnet_ids = module.eks_prerequisites.private_subnets
  control_plane_subnet_ids = module.eks_prerequisites.private_subnets

  eks_managed_node_group_default_instance_types = ["t3.small", "t4g.small"]
  
  eks_tags = {
    Name       = "cdcd_demo_eks"
    managed_by = "Terraform"
    created_by = "sawlemon"
    pupose     = "handson"
  }
}

output "eks_output" {
  value = module.eks
}