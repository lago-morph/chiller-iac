terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

data "aws_availability_zones" "available" {}
resource "aws_default_subnet" "default_subnet" {
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ab4d1e9cf9a1215a"
  instance_type = "t3.micro"
  subnet_id     = aws_default_subnet.default_subnet.id
}
