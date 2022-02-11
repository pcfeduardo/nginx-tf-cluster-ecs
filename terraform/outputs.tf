output "cluster_ecs_alb_dns_name" {
  description = "ALB - DNS Name"
  value       = module.cluster_ecs.alb.dns_name
}

output "cname_alb" {
  description = "Route53 - ALB CNAME"
  value       = module.cluster_ecs.alb_cname.fqdn
}