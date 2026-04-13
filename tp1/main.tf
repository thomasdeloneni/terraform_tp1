terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    StudentName = "thomas_delon"
    PromoName   = "EADL-2026"
    course      = "TF-2026-02"
    Name = "tf-thomasdelon-dev-vpc"
  }
}
