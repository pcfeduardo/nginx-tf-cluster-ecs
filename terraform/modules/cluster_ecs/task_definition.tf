resource "aws_ecs_task_definition" "nginx_alpine" {
  family = "nginx-alpine"
  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.image_name
      essential = true

      logConfiguration: {
        logDriver = "awslogs"
        options: {
          awslogs-group           = "/ecs/nginx-alpine",
            awslogs-region        = "us-east-2",
            awslogs-stream-prefix = "ecs"
        }
      }

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]

      
    }
  ])
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

}