variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "cdcd_demo_eks"
}

variable "cluster_version" {
  description = "The version of the EKS cluster."
  type        = string
  default     = "1.29"
}

variable "eks_managed_node_group_default_instance_types" {
  description = "Default instance types for the EKS managed node groups."
  type        = list(string)
  default     = ["t3.small", "t4g.small"]
}

variable "vpc_id" {
  description = "The ID of the VPC to create the EKS cluster in."
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets to create the EKS cluster in."
  type        = list(string)
}

variable "control_plane_subnet_ids" {
  description = "The IDs of the subnets to create the EKS control plane in."
  type        = list(string)
}

variable "eks_tags" {
  description = "Tags to apply to the EKS cluster."
  type        = map(string)
  default = {
    Name       = "cicd-demo-cluster"
    managed_by = "Terraform"
    created_by = "sawlemon"
    pupose     = "handson"
  }
}