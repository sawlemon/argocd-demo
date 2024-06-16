region = "us-east-1"

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
  pupose       = "testing"
  input_source = "tfvars_file"
}