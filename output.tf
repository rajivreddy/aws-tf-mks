output "zookeeper_connect_string" {
  value = aws_msk_cluster.this.zookeeper_connect_string
}

output "bootstrap_brokers" {
  description = "Plaintext connection host:port pairs"
  value       = aws_msk_cluster.this.bootstrap_brokers
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = aws_msk_cluster.this.bootstrap_brokers_tls
}
output "current_version" {
  description = "Current version of the MSK Cluster used for updates"
  value       = aws_msk_cluster.this.current_version
}
