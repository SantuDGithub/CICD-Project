provider "aws" {
  region = "ap-south-1"
}
resource "aws_ecr_repository" "my_repository" {
  name = "jenkins-pipeline-build-nginx"
}
resource "aws_ecs_cluster" "my_cluster" {
  name = "my-ecs-cluster"
}
data "aws_ecr_authorization_token" "ecr_auth_token" {}
resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = "my-task-family"
  container_definitions    = jsonencode([{
    name      = "my-container"
    image     = "${aws_ecr_repository.my_repository.repository_url}:latest"
    memory    = 128
    cpu       = 256
    portMappings = [{
      containerPort = 80
      protocol      = "tcp"
    }]
  }])
}
resource "aws_ecr_image" "my_image" {
  repository_name = aws_ecr_repository.my_repository.name
  image_tag       = "latest"
  image_digest    = data.aws_ecr_authorization_token.ecr_auth_token.authorization_data[0].proxy_endpoint
}
resource "aws_ecs_service" "my_service" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = 1
  deployment_controller {
    type = "ECS"
  }
  load_balancer {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/my-target-group/abcdef0123456789"
    container_name   = "my-container"
    container_port   = 80
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

  
