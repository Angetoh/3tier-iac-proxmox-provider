# 3-Tier Infrastructure as Code — Proxmox Provider

Automated 3-tier infrastructure deployment in one click using Terraform + Ansible on Proxmox.

## Architecture

Internet → Nginx (Reverse Proxy) → Flask (API) → PostgreSQL (Database)


## Tech Stack

- **Terraform** — VM provisioning on Proxmox
- **Ansible** — Configuration management & application deployment
- **Proxmox** — On-premise hypervisor (homelab)
- **AlmaLinux** — VM OS (cloud-init template)

## One-Click Deployment

    cd terraform
    terraform init
    terraform apply

Terraform provisions the 3 VMs, generates the Ansible inventory and automatically triggers the application deployment.

## Project Structure

    ├── terraform/          # Proxmox provisioning
    │   ├── modules/vm/     # Reusable VM module
    │   └── main.tf         # Orchestration
    └── ansible/            # Configuration management
        ├── roles/
        │   ├── deploy_app_nginx/
        │   ├── deploy_flask/
        │   └── deploy_postgresql/
        └── playbook/site.yaml

## Author

Ange TOH — Infrastructure Automation Engineer
Côte d'Ivoire 🇨🇮
