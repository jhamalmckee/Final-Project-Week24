#---loadbalancer/main.tf---

resource "aws_lb" "week24_loadbalancer" {
  name               = "${var.main}-APPLICATION-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.web_sg]
  subnets            = tolist(var.public_subnet)
}


resource "aws_lb_target_group" "week24_target_group" {
    name        = "${var.main}-TARGET-GROUP"
  port        = var.listener_port
  protocol    = var.listener_protocol
  target_type = "instance"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [name]
  }

  health_check {
    enabled             = true
    interval            = var.lb_interval 
    path                = "/"
    timeout             = var.lb_timeout
    healthy_threshold   = var.lb_healthy_threshold 
    unhealthy_threshold = var.lb_unhealthy_threshold
  }
}


# LOADBALANCER LISTENER
resource "aws_lb_listener" "week24_loadbalancer_listener" {
  load_balancer_arn = aws_lb.krypt0_24_loadbalancer.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.week24_target_group.arn
  }
}



