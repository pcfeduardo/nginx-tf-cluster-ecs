variable "container_name" {
  type = string
  description = "Enter the name of the container to be used by the task definition"
  default = "nginx-alpine"
}

variable "vpc_id" {
  type        = string
  description = "Enter the VPC id to be used by the ECS service"
}

variable "subnet" {
  type = string
  description = "Inform the subnet to be used in the ECS service"
}

variable "image_name" {
  type = string
  description = "Enter the image address"
}