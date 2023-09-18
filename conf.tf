provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16" # Adjust the CIDR block as needed
}

resource "aws_subnet" "my_subnet" {
  count = 2

  cidr_block = element(["10.0.1.0/24", "10.0.2.0/24"], count.index)
  vpc_id     = aws_vpc.my_vpc.id
}

resource "aws_security_group" "ecs_sg" {
  name_prefix = "ecs-sg-"
  vpc_id      = aws_vpc.my_vpc.id # Associate the security group with the same VPC

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow incoming traffic from anywhere (for demonstration purposes)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "my-cluster"
}

resource "aws_iam_role" "ecs_execution_role" {
  name = "ecs_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_ecs_task_definition" "my_app" {
  family                   = "my-app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256" # CPU units
  memory                   = "512" # Memory in MiB

  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([{
    name  = "my-app-container"
    image = "your-nodejs-app-image:latest" # Replace with your Docker image URL

    portMappings = [{
      containerPort = 80 # Port your Node.js app is listening on
      hostPort      = 80
    }]
  }])
}

resource "aws_ecs_service" "my_app_service" {
  name            = "my-app-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_app.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets = aws_subnet.my_subnet[*].id
    security_groups = [aws_security_group.ecs_sg.id]
  }
}

output "ecs_service_name" {
  value = aws_ecs_service.my_app_service.name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.my_cluster.name
}
