terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.1.7"
}

provider "aws" {
  region  = var.region
}

module "Wordpress" {
    source = "./WordpressTurbinado"
    region = var.region
}