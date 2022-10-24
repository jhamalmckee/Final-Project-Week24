variable "main" {}
variable "vpc_cidr" {}
variable "instance_type" {}
variable "image_id" {}
variable "key_name" {}
variable "region" {}
variable "access_ip" {
  type = string
  default = "174.57.67.44/32"
}