#---loadbalancer/variables.tf---

output "target_group_arn" {
  value = aws_lb_target_group.krypt0_24_target_group.arn
}

output "loadbalancer_dns" {
  value = aws_lb.krypt0_24_loadbalancer.dns_name
}

output "load_balancer" {
  value = aws_lb.krypt0_24_loadbalancer.id
}