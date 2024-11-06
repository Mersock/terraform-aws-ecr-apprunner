# Main Terraform configuration file

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "ecr" {
  source = "./ecr"
}

module "app_runner" {
  source             = "./app_runner"
  ecr_repository_url = "${module.ecr.repository_url}:latest"
}