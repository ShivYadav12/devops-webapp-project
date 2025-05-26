# Terraform + Ansible + Docker Web App Deployment

## Overview
This project provisions an AWS EC2 instance using Terraform, then uses Ansible to install Docker and deploy a simple Flask web application inside a Docker container.

## Technologies Used
- Terraform
- AWS EC2, Security Groups
- Ansible
- Docker
- Flask (Python)

## Prerequisites
- AWS CLI configured with appropriate credentials
- Terraform installed
- Ansible installed
- SSH key pair available at `~/.ssh/id_rsa.pub`
- Python 3.x installed locally

## Setup Instructions

### Step 1: Provision AWS Infrastructure
```bash
cd terraform
terraform init
terraform apply
```

### Step 2: Configure Ansible Inventory
Edit `ansible/inventory.ini` and add your instance's public IP under [web].

### Step 3: Deploy the app with Ansible
```bash
cd ansible
ansible-playbook -i inventory.ini deploy.yml
```

### Step 4: Access the web app
Navigate to http://<your-ec2-public-ip>/ to see the app.

## Notes
- Adjust AWS region and AMI as per your needs
- Make sure your SSH key paths are correct