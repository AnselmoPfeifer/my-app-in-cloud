output "app-server-1" {
  value = [
    "${aws_instance.ec2-app-server-one.tags.Name}",
    "${aws_instance.ec2-app-server-one.public_dns}",
    "port=22"
  ]
}

output "app-server-2" {
  value = [
    "${aws_instance.ec2-app-server-two.tags.Name}",
    "${aws_instance.ec2-app-server-two.public_dns}",
    "port=22"
  ]
}

output "public-access" {
  value = [
    "${aws_elb.app-server.dns_name}",
    "port=80"
  ]
}