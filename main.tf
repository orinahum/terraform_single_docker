# main.tf

# Docker provider for managing containers
provider "docker" {}

# Template file for dynamic NGINX configuration with DNS name
data "template_file" "nginx_conf" {
  template = file("${path.module}/nginx/default.conf.tpl")
  vars = {
    fake_dns_name = var.fake_dns_name
  }
}

# Generate the actual NGINX configuration file from the template
resource "local_file" "nginx_conf" {
  content  = data.template_file.nginx_conf.rendered
  filename = "${path.module}/nginx/default.conf"
}

# Build and tag the app container image using the custom Dockerfile
resource "docker_image" "app_image" {
  build {
    context    = "${path.module}/app"
    dockerfile = "Dockerfile"
  }
  name = "hello-world-app"
}

# App container resource with port mapping
resource "docker_container" "app" {
  name  = var.app_container_name
  image = docker_image.app_image.latest
  ports {
    internal = 80
    external = var.app_external_port
  }
}

# NGINX load balancer image configuration
resource "docker_image" "nginx_image" {
  name = var.nginx_image_name
}

# NGINX load balancer container with SSL and proxy settings
resource "docker_container" "nginx" {
  name  = var.nginx_container_name
  image = docker_image.nginx_image.latest
  ports {
    internal = 443
    external = var.nginx_external_port
  }

  # Volume mounts for dynamic NGINX configuration and SSL certificate files
  volumes {
    host_path      = local_file.nginx_conf.filename
    container_path = "/etc/nginx/conf.d/default.conf"
  }

  volumes {
    host_path      = "${path.module}/${var.nginx_ssl_path}/server.crt"
    container_path = "/etc/nginx/ssl/server.crt"
  }

  volumes {
    host_path      = "${path.module}/${var.nginx_ssl_path}/server.key"
    container_path = "/etc/nginx/ssl/server.key"
  }

  depends_on = [docker_container.app, local_file.nginx_conf]
}

# Local-exec provisioner to add NGINX IP to /etc/hosts with fake DNS name
resource "null_resource" "update_hosts" {
  provisioner "local-exec" {
    command = <<EOT
      HOST_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${docker_container.nginx.name})
      if ! grep -q "${var.fake_dns_name}" /etc/hosts; then
        echo "$HOST_IP ${var.fake_dns_name}" | sudo tee -a /etc/hosts
      fi
    EOT
  }

  depends_on = [docker_container.nginx]
}

# Output the IP address of the NGINX load balancer container
output "nginx_ip" {
  description = "The IP address of the NGINX load balancer container"
  value       = docker_container.nginx.network_data[0].ip_address
}
