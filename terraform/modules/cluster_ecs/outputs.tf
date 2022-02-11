output "alb" {
  value       = aws_lb.alb_nginx_alpine
  description = "All outputs from ALB"
}

output "alb_cname" {
  value       = aws_route53_record.alb_nginx_dns
  description = "All outputs from Route53"
}