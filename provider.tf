terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIATP6ALDC755VUEYG3"
  secret_key = "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"
}