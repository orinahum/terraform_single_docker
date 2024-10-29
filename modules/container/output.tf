output "ip" {
  value = docker_container.container_id.network_data[0].ip_address
}

output "container_name" {
  value = docker_container.container_id.name
}

output "network" {
  value = docker_container.container_id.network_data
}
