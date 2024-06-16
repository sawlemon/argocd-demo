variable "vpc_name" {
  type    = string
  default = "cicd-demo-vpc"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "The availability zones for the subnets."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets" {
  description = "The CIDR blocks for the private subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "The CIDR blocks for the public subnets."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway."
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Enable single NAT gateway."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to the VPC."
  type        = map(string)
  default = {
    Name       = "cicd-demo-vpc"
    managed_by = "Terraform"
    created_by = "sawlemon"
    pupose     = "handson"
  }
}