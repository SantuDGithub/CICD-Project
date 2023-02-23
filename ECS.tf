provider "aws" {
  region = "ap-south-1"
}
resource "aws_ecs_cluster" "mydemo" {
  name = "my-cluster"
}
resource "aws_ecs_task_definition" "mydemo" {
  family                   = "mydemo-task"
  container_definitions    = <<DEFINITION
  [
    {
      "name": "my-container",
      "image": "nginx:latest",
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ]
    }
  ]
  DEFINITION
}
resource "aws_ecs_service" "my" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.my.id
  task_definition = aws_ecs_task_definition.mydemo.arn
  desired_count   = 1
  network_configuration {
    subnets          = ["subnet-02bcdf444fb3b31c4", "subnet-078216899fe60a4c7"]
    security_groups  = ["acl-0ae2b90f7631487ac"]
    assign_public_ip = true
  }
}
