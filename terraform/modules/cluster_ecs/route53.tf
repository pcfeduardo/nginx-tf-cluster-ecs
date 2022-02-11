resource "aws_route53_record" "alb_nginx_dns" {
  zone_id = var.route53_cfg.zone_id
  name    = var.route53_cfg.dns_record
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.alb_nginx_alpine.dns_name]
}


