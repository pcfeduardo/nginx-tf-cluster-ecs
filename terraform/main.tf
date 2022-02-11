provider "aws" {
  region = "us-east-2"
}

terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket = "tf-demo-states"
    key    = "tf-remote-example.tfstate"
    region = "us-east-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}