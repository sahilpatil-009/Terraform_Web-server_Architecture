##=========Connect With AWS====##
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "${var.AWS_REGION}"
  access_key = "${var.ACCESS_KEY}"
  secret_key = "${var.SECRET_KEY}"
}
