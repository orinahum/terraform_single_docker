resource "docker_container" "nginx" {
  name  = var.nginx_container_name
  image = var.nginx_image_name
  networks_advanced {
    name = var.network_id
  }
  ports {
    internal = var.nginx_int_port
    external = var.nginx_ext_port
  }
  volumes {
    host_path = "${path.module}/default.conf.tpl"
    container_path = "etc/nginx/nginx.com"
  }
  volumes {
    host_path = "./ssl/server.crt"
    container_path = "/etc/nginx/ssl/server.crt"
  }
  volumes {
    host_path = "./ssl/server.key"
    container_path = "/etc/nginx/ssl/server.key"
  }
}
