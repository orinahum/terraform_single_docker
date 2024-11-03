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

## Checking if Ansible Playbook is available
( which ansible-playbook &> /dev/null && echo "[+] Ansible-Playbook is available" ) || \
    ( echo "[-] Ansible Playbook not found, existing" && exit 2 )

