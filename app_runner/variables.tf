variable "iam_role_name" {
  description = "Name of the IAM role for App Runner"
  type        = string
  default     = "app-runner-role"
}

variable "app_runner_service_name" {
  description = "Name of the App Runner service"
  type        = string
  default     = "my-app-service"
}

variable "container_port" {
  description = "Port on which the container is listening"
  type        = number
  default     = 80
}

variable "ecr_repository_url" {
  description = "URL of the ECR repository"
  type        = string
}