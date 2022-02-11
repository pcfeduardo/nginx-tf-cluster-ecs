resource "aws_ecs_service" "svc_nginx" {
  name            = "svc-nginx"
  launch_type     = "FARGATE"
  cluster         = aws_ecs_cluster.cl_nginx_tf.id
  task_definition = aws_ecs_task_definition.nginx_alpine.arn
  desired_count   = 1

  network_configuration {
    subnets          = [var.subnet]
    security_groups  = [aws_security_group.allow_http_from_sg_alb.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg_svc_nginx_alpine.arn
    container_name   = "nginx-alpine"
    container_port   = 80
  }

}