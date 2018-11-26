provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_key_pair" "key-pair" {
  key_name   = "my-app-in-cloud"
  public_key = <PUBLIC_KEY>
}

variable "aws_region" {
  default = <AWS_DEFAULT_REGION>
}

variable "aws_ami" {
  default = <AWS_AMI_ID>
}
