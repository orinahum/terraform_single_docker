variable "app_image_name" {
  description = "Docker image name for the app container"
  type        = string
  default     = "nginx:alpine"
}

variable "app_container_name" {
  description = "Name of the app container"
  type        = string
  default     = "app"
}

variable "app_external_port" {
  description = "External port for the app container"
  type        = number
  default     = 8081
}

variable "nginx_image_name" {
  description = "Docker image name for the NGINX load balancer"
  type        = string
  default     = "nginx:alpine"
}

variable "nginx_container_name" {
  description = "Name of the NGINX container"
  type        = string
  default     = "nginx_lb"
}

variable "nginx_external_port" {
  description = "External port for the NGINX load balancer"
  type        = number
  default     = 443
}

variable "nginx_config_path" {
  description = "Path to the NGINX configuration directory"
  type        = string
  default     = "nginx"
}

variable "nginx_ssl_path" {
  description = "Path to the SSL certificates directory"
  type        = string
  default     = "nginx/ssl"
}

variable "fake_dns_name" {
  description = "Fake DNS name to be added to /etc/hosts"
  type        = string
  default     = "example.local"
}
