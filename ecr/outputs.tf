output "repository_url" {
  value       = aws_ecr_repository.app_repository.repository_url
  description = "The URL of the ECR repository"
}