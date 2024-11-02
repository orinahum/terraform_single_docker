# nginx/default.conf.tpl

server {
    listen 443 ssl;
    server_name ${fake_dns_name};

    ssl_certificate /etc/nginx/ssl/server.crt;
    ssl_certificate_key /etc/nginx/ssl/server.key;

    location / {
        proxy_pass app:8000;
    }
}
