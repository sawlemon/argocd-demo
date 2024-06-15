# main.tf
provider "aws" {
  region = var.region # Specify the AWS region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = var.terraform_aws_vpc_module_version

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = var.vpc_tags
}