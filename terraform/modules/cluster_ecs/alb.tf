
resource "aws_lb" "alb_nginx_alpine" {
  name               = "alb-nginx-alpine"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_from_internet.id]
  subnets            = [var.subnets.subnet1, var.subnets.subnet2, var.subnets.subnet1]
  

}

resource "aws_lb_listener" "alb_listener_nginx_alpine" {
  load_balancer_arn = aws_lb.alb_nginx_alpine.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_svc_nginx_alpine.arn
  }
}


resource "aws_lb_target_group" "tg_svc_nginx_alpine" {
  name        = "tg-svc-nginx-alpine"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    enabled             = true
    path                = "/"
    port                = "traffic-port"
    interval            = "30"
    protocol            = "HTTP"
    healthy_threshold   = "3"
    unhealthy_threshold = "3"
    timeout             = "5"
    matcher             = "200"
  }
}