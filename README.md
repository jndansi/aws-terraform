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

Follow these steps to set up the project on your local machine or on a cloud server:

1. **Fork and Clone the Repository:**
   - Fork this repository and clone it locally. This allows you to customize the files according to your needs and use your repository in the pipeline.

2. **Ensure Port 8080 is Open for Jenkins Server:**
   - Jenkins runs on port 8080. Ensure that this port is open for your Jenkins server.

3. **Install Terraform:**
   - Follow the [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli).

4. **Install Git:**
   - Follow the [Git Installation Guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

5. **Install Jenkins:**
   - Follow the Jenkins installation instructions suitable for your environment.

6. **Access Jenkins:**
   - Open Jenkins using either `localhost:8080` or `<public-ip address>:8080`, depending on your Jenkins configuration.

7. **Install AWS Credentials Plugin in Jenkins:**
   - Configure your AWS credentials using your 'Access Key ID' and 'Secret Access Key' by installing the AWS Credentials Plugin in Jenkins.

8. **Configure Jenkins Pipeline:**
   - Set up a Jenkins pipeline for automating infrastructure provisioning. Choose 'Pipeline script from SCM' and point the 'Script Path' to the `Jenkinsfile` in your repository.

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


