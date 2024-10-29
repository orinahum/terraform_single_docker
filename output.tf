# output.tf

# Output the IP address of the NGINX load balancer container
output "nginx_ip" {
  description = "The IP address of the NGINX load balancer container"
  value       = docker_container.nginx.network_data[0].ip_address
}

# Output the IP address of the App container
output "app_ip" {
  description = "The IP address of the App container"
  value       = docker_container.app.network_data[0].ip_address
}

# Output the external port of the NGINX load balancer
output "nginx_external_port" {
  description = "The external port on which the NGINX load balancer is accessible"
  value       = var.nginx_external_port
}

# Output the DNS entry to be used for the application
output "fake_dns_entry" {
  description = "The DNS name for accessing the NGINX load balancer"
  value       = var.fake_dns_name
}
