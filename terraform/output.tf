output "inforsan-instances" {
  value = ["${aws_instance.ec2-nginx-proxy.tags.Name}", "${aws_instance.ec2-nginx-proxy.public_dns}"]
}

output "events-api" {
  value = ["${aws_instance.ec2-events-api.tags.Name}", "${aws_instance.ec2-events-api.public_dns}"]
}

output "events" {
  value = ["${aws_instance.ec2-events.tags.Name}", "${aws_instance.ec2-events.public_dns}"]
}


output "importer" {
  value = ["${aws_instance.ec2-importer.tags.Name}", "${aws_instance.ec2-importer.public_dns}"]
}

output "infodata" {
  value = ["${aws_instance.ec2-infodata.tags.Name}", "${aws_instance.ec2-infodata.public_dns}"]
}


output "dma-api" {
  value = ["${aws_instance.ec2-dma-api.tags.Name}", "${aws_instance.ec2-dma-api.public_dns}"]
}

output "simulation-api-ip" {
  value = ["${aws_instance.ec2-simulation-api.public_dns}", "${aws_instance.ec2-simulation-api.tags.Name}"]
}