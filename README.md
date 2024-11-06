# AWS ECR and App Runner Terraform Configuration

This repository contains Terraform configuration for creating an AWS ECR private repository and an AWS App Runner service in the ap-southeast-1 region.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed (version 0.12 or later)
- AWS CLI configured with appropriate credentials

## Step-by-step Instructions

1. Clone this repository and navigate to the project directory.

2. Initialize Terraform:
   ```
   terraform init
   ```

3. Review the planned changes:
   ```
   terraform plan
   ```

4. Apply the ECR module:
   ```
   terraform apply -target=module.ecr
   ```

5. Apply the App Runner module:
   ```
   terraform apply -target=module.app_runner
   ```

6. Apply any remaining changes:
   ```
   terraform apply
   ```

7. To destroy the infrastructure when no longer needed:
   ```
   terraform destroy
   ```

## Notes

- The ECR repository is created with mutable image settings and image scanning disabled.
- The ECR repository policy allows permissions for pushing and pulling images.
- The App Runner service uses port 80 and sources its image from the created ECR repository.
- An IAM role is created and attached to the App Runner service for ECR access.

Please review and adjust the configuration files as needed before applying them to your AWS environment.