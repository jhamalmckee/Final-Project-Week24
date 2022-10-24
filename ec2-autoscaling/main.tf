#---ec2-autoscaling/main.tf---

resource "aws_launch_template" "krypt0-launch-template" {
  name                   = "${var.main}-ASG"
  image_id               = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.web_sg]
}

resource "aws_autoscaling_group" "krypt0-asg" {
  name                      = "${var.main}-AUTOSCALING_GROUP"
  max_size                  = 3
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  vpc_zone_identifier       = tolist(var.public_subnet)
  target_group_arns         = [var.target_group_arn]

  launch_template {
    id = aws_launch_template.krypt0-launch-template.id
  }
}

