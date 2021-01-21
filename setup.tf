terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "nulldiv-web-tf"
    key    = "state/tfstate.state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}