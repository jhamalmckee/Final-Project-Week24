#---networking/variables.tf---

variable "main" {}
variable "vpc_cidr" {}
variable "public_subnet_count" {
  default = 2
}
variable "access_ip" {
  type = string
}
variable "public_cidrs" {
  type = list(any)
}