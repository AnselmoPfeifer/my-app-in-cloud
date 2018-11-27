provider "aws" {
  region = "${var.aws_region}"
  access_key = "<AWS_ACCESS_KEY_ID>"
  secret_key = "<AWS_SECRET_ACCESS_KEY>"
}

data "aws_availability_zones" "available" {}

terraform {
  backend "s3" {
    bucket = "terraform-backend-anselmo"
    key    = "terraform/backend/terraform.tfstate"
    region = "<AWS_DEFAULT_REGION>"
    access_key = "<AWS_ACCESS_KEY_ID>"
    secret_key = "<AWS_SECRET_ACCESS_KEY>"
  }
}

variable "aws_region" {
  default = "<AWS_DEFAULT_REGION>"
}

variable "aws_ami" {
  default = <AWS_AMI_ID>
}

variable "label" {
  default = "<AWS_LABEL>"
}