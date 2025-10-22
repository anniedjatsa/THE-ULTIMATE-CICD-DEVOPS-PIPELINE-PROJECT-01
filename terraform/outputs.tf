output "jenkins_k8s_master_public_ip" {
  description = "Public IP of Jenkins and K8s Master server"
  value       = aws_instance.jenkins_k8s_master.public_ip
}

output "jenkins_k8s_master_private_ip" {
  description = "Private IP of Jenkins and K8s Master server"
  value       = aws_instance.jenkins_k8s_master.private_ip
}

output "k8s_worker_1_public_ip" {
  description = "Public IP of K8s Worker 1"
  value       = aws_instance.k8s_worker_1.public_ip
}

output "k8s_worker_1_private_ip" {
  description = "Private IP of K8s Worker 1"
  value       = aws_instance.k8s_worker_1.private_ip
}

output "k8s_worker_2_public_ip" {
  description = "Public IP of K8s Worker 2"
  value       = aws_instance.k8s_worker_2.public_ip
}

output "k8s_worker_2_private_ip" {
  description = "Private IP of K8s Worker 2"
  value       = aws_instance.k8s_worker_2.private_ip
}

output "nexus_sonarqube_public_ip" {
  description = "Public IP of Nexus and SonarQube server"
  value       = aws_instance.nexus_sonarqube.public_ip
}

output "nexus_sonarqube_private_ip" {
  description = "Private IP of Nexus and SonarQube server"
  value       = aws_instance.nexus_sonarqube.private_ip
}

output "monitoring_public_ip" {
  description = "Public IP of Monitoring server"
  value       = aws_instance.monitoring.public_ip
}

output "monitoring_private_ip" {
  description = "Private IP of Monitoring server"
  value       = aws_instance.monitoring.private_ip
}

output "jenkins_url" {
  description = "Jenkins URL"
  value       = "http://${aws_instance.jenkins_k8s_master.public_ip}:8080"
}

output "nexus_url" {
  description = "Nexus URL"
  value       = "http://${aws_instance.nexus_sonarqube.public_ip}:8081"
}

output "sonarqube_url" {
  description = "SonarQube URL"
  value       = "http://${aws_instance.nexus_sonarqube.public_ip}:9000"
}

output "grafana_url" {
  description = "Grafana URL"
  value       = "http://${aws_instance.monitoring.public_ip}:3000"
}

output "prometheus_url" {
  description = "Prometheus URL"
  value       = "http://${aws_instance.monitoring.public_ip}:9090"
}

output "ssh_commands" {
  description = "SSH commands to connect to instances"
  value = {
    jenkins_k8s_master = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.jenkins_k8s_master.public_ip}"
    k8s_worker_1       = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.k8s_worker_1.public_ip}"
    k8s_worker_2       = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.k8s_worker_2.public_ip}"
    nexus_sonarqube    = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.nexus_sonarqube.public_ip}"
    monitoring         = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.monitoring.public_ip}"
  }
}