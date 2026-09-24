resource "aws_launch_template" "app" {
  name_prefix   = "tf-app-lt-"
  image_id      = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_name

  vpc_security_group_ids = var.security_group_ids

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 8
      volume_type = "gp3"
      encrypted   = true
    }
  }

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    echo "<h1>Served by $(hostname -f)</h1>" > /var/www/html/index.html
    systemctl enable --now nginx
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "tf-asg-instance"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app" {
  name                = "tf-app-asg"
  vpc_zone_identifier = var.subnet_ids

  min_size         = 1
  max_size         = 3
  desired_capacity = 2

  health_check_type         = "ELB"
  health_check_grace_period = 120

  target_group_arns = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "tf-asg-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "cpu" {
  name                   = "tf-cpu-target-tracking"
  autoscaling_group_name = aws_autoscaling_group.app.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}
