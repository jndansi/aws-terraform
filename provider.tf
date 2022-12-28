terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}

provider "aws" {
  shared_credentials_file = "/var/jenkins_home/workspace/aws-infrastructure/configure"
  region = "us-east-1"
}
