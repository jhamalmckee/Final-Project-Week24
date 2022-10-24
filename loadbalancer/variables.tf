#---loadbalancer/variables.tf---

variable "public_subnet" {}
variable "main" {}
variable "vpc_id" {}
variable "web_sg" {}
# variable "private_sg" {}
variable "target_group_port" {
  default = 80
}
variable "target_group_protocol" {
  default = "HTTP"
}
variable "listener_port" {
  default = 80
}
variable "listener_protocol" {
  default = "HTTP"
}
variable "lb_healthy_threshold" {
  default = 2
}
variable "lb_unhealthy_threshold" {
  default = 2
}
variable "lb_timeout" {
  default = 3
}
variable "lb_interval" {
  default = 30
}