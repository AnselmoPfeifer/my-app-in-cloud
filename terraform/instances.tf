resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "iam-appserver-profile"
  role = "${aws_iam_role.ec2_role.name}"
}

resource "aws_instance" "ec2-app-server" {
  iam_instance_profile = "${aws_iam_instance_profile.iam_instance_profile.id}"
  subnet_id = "${var.aws_subnet_id}"
  instance_type = "t2.nano"
  ami = "${var.aws_ami}"
  associate_public_ip_address = true
  monitoring = false

  security_groups = [
    "${aws_security_group.internal_access.id}"
  ]

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "app-server"
  }
}