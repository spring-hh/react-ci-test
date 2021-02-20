provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket  = "cinema-app-tf-state20210220"
    key     = "app-cinema.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManageBy    = "Terraform"
    Owner       = "hayashi"
  }
}
