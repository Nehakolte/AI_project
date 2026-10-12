terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

# Optional AWS lab only. This starter project runs locally without Terraform.
provider "aws" {
  region = var.aws_region
}
