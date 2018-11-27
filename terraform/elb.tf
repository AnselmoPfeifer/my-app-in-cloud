resource "aws_elb" "app-server" {
  name                = "webserver-terraform-elb"

  subnets             = [
    "${aws_subnet.subnet.*.id}"
  ]

  security_groups = [
    "${aws_security_group.external_proxy_access.id}"
  ]

  instances                   = [
    "${aws_instance.ec2-app-server-one.id}",
    "${aws_instance.ec2-app-server-two.id}"
  ]

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400



  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 30
  }

  tags {
    Name = "webserver-terraform-elb"
  }
}

resource "aws_app_cookie_stickiness_policy" "stickiness" {
  name          = "stickiness-policy"
  load_balancer = "${aws_elb.app-server.name}"
  lb_port       = 80
  cookie_name   = "AppCookie"
}