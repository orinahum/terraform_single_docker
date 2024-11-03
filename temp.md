Generate SSL Certificates
Use OpenSSL to generate a self-signed certificate for the NGINX load balancer. Place server.crt and server.key in nginx/ssl/.

mkdir -p nginx/ssl
openssl req -x509 -newkey rsa:2048 -nodes -keyout nginx/ssl/server.key -out nginx/ssl/server.crt -days 365




