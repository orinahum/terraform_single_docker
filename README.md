# terraform_single_docker
terraform project file that will start multi container environment with nginx as loadbalancer and ssl configuration to be implemented.

## README.md Overview

The project includes a multi-container environment managed by Terraform and Docker. Below is an overview of the project structure and purpose:

### Project Overview

This project sets up a multi-container environment using Terraform and Docker. It includes:

- **NGINX Load Balancer**: An NGINX container configured with SSL to act as a load balancer.
- **App Container**: A simple application container that responds with "Hello World".

- **a breakdown of how each file works together**

1. `main.tf` – Main configuration file:

    - Creates the NGINX and app containers.
    - Uses docker_image to build the app container image from the app/Dockerfile.
    - Configures NGINX to act as a load balancer and proxy for the app container over HTTPS.
    - Generates a dynamic NGINX configuration with templatefile to incorporate the fake DNS name.
    - Uses a null_resource with local-exec to add the NGINX container’s IP to /etc/hosts.

2. `variables.tf` – Parameter definitions:
    - Defines variables for container names, image names, ports, and paths, allowing easy customization without modifying main.tf directly.

3. `output.tf` – Outputs:
    - Shows IP addresses for the NGINX and app containers, making it easy to retrieve these values after deployment.

4. `nginx/default.conf.tpl` – NGINX Configuration Template:
    - Template file that uses ${fake_dns_name} for dynamic DNS entry substitution.
    - Configures NGINX to forward requests on port 443 to the app container on port 80.

5. `app/Dockerfile` and `app/index.html` – "Hello World" App:
    - Dockerfile creates an NGINX-based image that serves the index.html file as a static HTML page.
    - index.html contains the "Hello World" message.

**How the Files Work Together**
1. Build the App Image: main.tf uses the custom app/Dockerfile to build the app container image. The app container serves the index.html file, which contains "Hello World".

2. NGINX as Load Balancer: The NGINX configuration (default.conf.tpl) uses Terraform’s templatefile function to insert the fake DNS name and forward HTTPS requests to the app container.

3. Access the App: Once deployed, you can access https://example.local (or your configured DNS) to see the "Hello World" message served by the app container through NGINX with SSL enabled.

### Project Structure

```
.
├── main.tf              # Main Terraform configuration file for setting up Docker containers
├── variables.tf         # Variable definitions for customizing container properties
├── output.tf            # Outputs to retrieve useful information (e.g., IP addresses)
├── nginx                # Directory for NGINX configuration and SSL certificates
│   ├── default.conf.tpl # NGINX config template for dynamic DNS and SSL settings
│   └── ssl              # SSL certificate storage
│       ├── server.crt   # Self-signed SSL certificate for HTTPS
│       └── server.key   # SSL certificate key
└── app                  # App directory for "Hello World" app setup
    ├── Dockerfile       # Dockerfile for building a simple "Hello World" app image
    └── index.html       # HTML file containing the "Hello World" message
```

## Usage

1. **Modify variables**: Adjust parameters like DNS name, port, and image names by modifying `variables.tf`.
2. **Deploy the project**: Follow the steps in `INSTALLATION.md` to deploy the environment.
3. **Access the application**: Once deployed, access the app using the fake DNS specified in `variables.tf`.

