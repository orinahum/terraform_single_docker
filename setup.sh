#!/usr/bin/env bash
################################################
# Created by Ori Nahum and Avishay Layani
# Purpose: Runs deployment using Terraform and Ansible
# Version: 0.0.1
# Date: 03/11/2024
# set -x          # Enable debug mode
set -o errexit  # Exit on any command failing 
set -o pipefail # Return non-zero status if any part of a pipeline fails
#################################################

## Check for dependencies

echo "Starting prerequisitions tests"
sleep 1
## Checking if Terraform exists
( which terraform &> /dev/null && echo "[+] Terraform is available" ) || \
    ( echo "[-] Terraform executeables not found, exiting" && exit 1 )

## Checking if Docker exists
( which docker &> /dev/null && echo "[+] Docker is available" ) || \
    ( echo "[-] Docker executeables not found, exiting" && exit 1 )

## Checking if Ansible Playbook is available
( which ansible-playbook &> /dev/null && echo "[+] Ansible-Playbook is available" ) || \
    ( echo "[-] Ansible Playbook not found, existing" && exit 2 )

## Running Terraform apply in terraform folder
terraform -chdir=terraform/ apply -auto-approve

## Copying nginx configuration files into docker
docker cp nginx_files/nginx.conf nginx:/etc/nginx/nginx.conf
docker cp nginx_files/server.key nginx:/etc/nginx/server.key
docker cp nginx_files/server.crt nginx:/etc/nginx/server.crt

docker restart nginx

sudo cat /etc/hosts | grep fake_hello_world || sudo echo "127.0.0.1    fake_hello_world" >> /etc/hosts




# ## Creating inventory file using the IP generated by terraform in terraform/nginx_ip.txt
# printf "[all]\n$(cat terraform/nginx_ip.txt)" > ansible_nginx/inventory.ini

# ## Running the Ansible playbook to modify nginx
# ansible-playbook ansible_nginx/nginx_playbook.yaml