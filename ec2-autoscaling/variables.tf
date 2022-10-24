#--/asg-variables---
variable "instance_type" {
  type        = string
  description = "Defines the instance type"
}

variable "image_id" {

  description = "Defines the image id"
}

variable "key_name" {
  type        = string
  description = "Defines the key name"
}

variable "main" {
  type        = string
  description = "Defines the project name"
}

variable "public_subnet" {}

variable "target_group_arn" {
  description = "Defines the target group via output"
}

variable "load_balancer" {
  type        = string
  description = "Defines the load balancer"
}

# variable "web_sg" {}
variable "web_sg" {}

