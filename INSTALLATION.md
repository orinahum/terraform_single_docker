# INSTALLATION.md

## Prerequisites

Before proceeding with the setup, make sure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Terraform](https://www.terraform.io/downloads)
- Access to modify `/etc/hosts` file with `sudo` privileges

## Setup Steps

1. **Clone the repository and navigate into the project directory**:
   ```bash
   git clone <repo-url>
   cd <repo-directory>
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Apply the Terraform configuration**:
   ```bash
   terraform apply
   ```
   > **Note**: You may need to enter your password to modify `/etc/hosts` during the deployment process.

4. **Verify deployment**:
   - Once the deployment is complete, verify it by accessing `https://example.local` in your browser.
   - If you have customized the DNS name in `variables.tf`, use that DNS name instead.