variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu 24.04 LTS"
  type        = string
  default     = "ami-0360c520857e3138f"
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
  default     = "terraform-offert-letter-key"
}

variable "instance_type_master" {
  description = "Instance type for Kubernetes Master and Jenkins"
  type        = string
  default     = "t2.medium"
}

variable "instance_type_worker" {
  description = "Instance type for Kubernetes Worker nodes"
  type        = string
  default     = "t2.medium"
}

variable "instance_type_monitoring" {
  description = "Instance type for Monitoring server"
  type        = string
  default     = "t2.medium"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  default     = "ultimate-cicd-devops"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}