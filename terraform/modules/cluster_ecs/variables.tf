variable "container_name" {
  type        = string
  description = "Enter the name of the container to be used by the task definition"
  default     = "nginx-alpine"
}

variable "vpc_id" {
  type        = string
  description = "Enter the VPC id to be used by the ECS service"
  default     = ""
}

variable "image_name" {
  type        = string
  description = "Enter the image address"
  default     = ""
}

variable "subnets" {
  type        = map(string)
  description = "Inform the subnet to be used in the ECS"
  default = {
    main    = ""
    subnet1 = ""
    subnet2 = ""
    subnet3 = ""
  }
}

variable "route53_cfg" {
  type        = map(string)
  description = "FQDN to ALB"
  default = {
    zone_id    = ""
    dns_record = ""
  }
}
