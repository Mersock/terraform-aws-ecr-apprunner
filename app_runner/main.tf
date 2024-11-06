# App Runner module

resource "aws_iam_role" "app_runner_role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "build.apprunner.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "app_runner_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
  role       = aws_iam_role.app_runner_role.name
}

resource "aws_apprunner_service" "app_service" {
  service_name = var.app_runner_service_name

  source_configuration {
    image_repository {
      image_configuration {
        port = var.container_port
      }
      image_identifier      = var.ecr_repository_url
      image_repository_type = "ECR"
    }
    authentication_configuration {
      access_role_arn = aws_iam_role.app_runner_role.arn
    }
  }
}