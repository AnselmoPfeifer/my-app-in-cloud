output "instance-one" {
  value = ["${aws_instance.ec2-app-server-one.tags.Name}", "${aws_instance.ec2-app-server-one.public_dns}"]
}

output "instance-one" {
  value = ["${aws_instance.ec2-app-server-two.tags.Name}", "${aws_instance.ec2-app-server-two.public_dns}"]
}

output "elb" {
  value = "${aws_elb.app-server.dns_name}"
}