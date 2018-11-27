provider "aws" {
  region = "${var.aws_region}"
}

data "aws_availability_zones" "available" {}

variable "aws_region" {
  default = "AWS_DEFAULT_REGION"
}

variable "aws_ami" {
  default = AWS_AMI_ID
}

variable "vpc_id" {
  default = "AWS_VPC_ID"
}

variable "aws_subnet_id" {
  default = "AWS_SUBNET_ID"
}

variable "label" {
  default = "AWS_LABEL"
}