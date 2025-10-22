terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Data source to get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Jenkins Server (Combined with K8s Master based on PDF diagram)
resource "aws_instance" "jenkins_k8s_master" {
  ami           = var.ami_id
  instance_type = var.instance_type_master
  key_name      = var.key_name
  vpc_security_group_ids = [
    aws_security_group.jenkins_sg.id,
    aws_security_group.k8s_master_sg.id
  ]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo hostnamectl set-hostname jenkins-k8s-master
              sudo apt-get update
              EOF

  tags = {
    Name        = "${var.project_name}-jenkins-k8s-master"
    Project     = var.project_name
    Environment = var.environment
    Role        = "Jenkins-K8s-Master"
  }
}

# Kubernetes Worker Node 1
resource "aws_instance" "k8s_worker_1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type_worker
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.k8s_worker_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo hostnamectl set-hostname k8s-worker-1
              sudo apt-get update
              EOF

  tags = {
    Name        = "${var.project_name}-k8s-worker-1"
    Project     = var.project_name
    Environment = var.environment
    Role        = "K8s-Worker"
  }
}

# Kubernetes Worker Node 2
resource "aws_instance" "k8s_worker_2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type_worker
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.k8s_worker_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo hostnamectl set-hostname k8s-worker-2
              sudo apt-get update
              EOF

  tags = {
    Name        = "${var.project_name}-k8s-worker-2"
    Project     = var.project_name
    Environment = var.environment
    Role        = "K8s-Worker"
  }
}

# Nexus and SonarQube Server
resource "aws_instance" "nexus_sonarqube" {
  ami                    = var.ami_id
  instance_type          = var.instance_type_master
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.tools_sg.id]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo hostnamectl set-hostname nexus-sonarqube
              sudo apt-get update
              EOF

  tags = {
    Name        = "${var.project_name}-nexus-sonarqube"
    Project     = var.project_name
    Environment = var.environment
    Role        = "Tools-Server"
  }
}

# Monitoring Server (Prometheus & Grafana)
resource "aws_instance" "monitoring" {
  ami                    = var.ami_id
  instance_type          = var.instance_type_monitoring
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo hostnamectl set-hostname monitoring
              sudo apt-get update
              EOF

  tags = {
    Name        = "${var.project_name}-monitoring"
    Project     = var.project_name
    Environment = var.environment
    Role        = "Monitoring"
  }
}