# AWS Infrastructure as Code with Terraform and Jenkins

## Overview

This project leverages Terraform and Jenkins to automate the provisioning of AWS infrastructure. The infrastructure includes:

- 2 EC2 instances as web servers
- 2 EC2 instances as databases
- 1 VPC (Virtual Private Cloud)
- 2 Subnets
- 1 Internet Gateway
- 2 Route Tables with associations to the subnets
- 2 Security Groups allowing ingress from ports 22, 80, and 443
- AWS Load Balancer Target Group with 3 different Target Group attachments to EC2 instances

## Project Structure

- `terraform/`: Contains Terraform manifests for provisioning AWS resources.
- `Jenkinsfile`: Jenkins Pipeline script for automating the infrastructure provisioning process.

## Getting Started

Follow these steps to set up the project on your local machine:

1. Clone the repository:

    ```bash
    git clone https://github.com/jndansi/aws-terraform.git
    cd aws-terraform
    ```

2. Install Terraform: [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)

3. Set up AWS Credentials: Ensure AWS credentials with appropriate permissions are set up on your machine.

4. Install Jenkins: Follow Jenkins installation instructions suitable for your environment.

5. Configure Jenkins Pipeline: Use the provided `Jenkinsfile` to set up a Jenkins pipeline for automating infrastructure provisioning.

## Jenkins Pipeline

The Jenkins pipeline defined in `Jenkinsfile` automates the following stages:

1. **Git Stage:**
   - Checks out the source code from the GitHub repository.

2. **Terraform Stage:**
   - Initializes Terraform.
   - Executes `terraform plan` to preview changes.
   - Executes `terraform apply` to apply changes.

## Startup Script

Some useful web server components are configured using the `startup-script.sh` file. The script includes the following:

```bash
#!/bin/bash
sudo apt-get update
sudo apt-get install -y python3

sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible

sudo apt install -y apache2

sudo apt install -y php libapache2-mod-php php-mysql
```

## License

This project is licensed under the [MIT License](https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt).


