# Ultimate CI/CD DevOps Pipeline - Terraform Infrastructure

This Terraform configuration creates the complete infrastructure for the Ultimate CI/CD DevOps Pipeline project.

## Infrastructure Components

- **Jenkins + K8s Master Server**: Combined server running Jenkins and Kubernetes master node
- **K8s Worker Nodes** (2): Kubernetes worker nodes for application deployment
- **Nexus + SonarQube Server**: Server hosting Nexus Repository and SonarQube
- **Monitoring Server**: Server running Prometheus and Grafana

## Prerequisites

1. AWS Account with appropriate permissions
2. AWS CLI configured with credentials
3. Terraform installed (>= 1.0)
4. SSH key pair created in AWS (terraform-offert-letter-key)

## Usage

1. Initialize Terraform:
```bash
   terraform init
```

2. Review the execution plan:
```bash
   terraform plan
```

3. Apply the configuration:
```bash
   terraform apply
```

4. View outputs:
```bash
   terraform output
```

## Outputs

The configuration provides:
- Public and private IPs for all servers
- URLs for accessing services (Jenkins, Nexus, SonarQube, Grafana, Prometheus)
- SSH commands for connecting to each server

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

## Security Groups

- **Jenkins SG**: Ports 22, 80, 443, 8080, 25, 465, 3000-10000, 30000-32767, 9100
- **K8s Master SG**: Ports 22, 6443, 2379-2380, 10250, 10257, 10259, 30000-32767, 179, 80, 443
- **K8s Worker SG**: Ports 22, 10250, 30000-32767, 179, 80, 443
- **Tools SG**: Ports 22, 80, 443, 8081, 9000
- **Monitoring SG**: Ports 22, 80, 443, 3000, 9090, 9100, 9115