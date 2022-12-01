#---networking/outputs.tf---

output "public_subnet" {
  value = aws_subnet.week24_public_subnet.*.id
}

output "vpc_id" {
  value = aws_vpc.week24_vpc.id
}

output "public_sg" {
  value = aws_security_group.bastion-host-sg.id
}

output "private_sg" {
  value = aws_security_group.loadbalancer-sg.id
}

output "web_sg" {
  value = aws_security_group.week24_web_sg.id
}
