terraform {
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "snackshop-terraform-state-bucket"
    key    = "infra-terraform-state"
    region = "us-west-2"
  }
}
provider "aws" {
 region = var.region
}

module "infra" {
    source                           = "./modules/infra"
    availability_zones               = var.availability_zones
    repository_name                  = var.repository_name
    cluster_name                     = var.cluster_name
    cluster_version                  = var.cluster_version
    desired_size                     = var.desired_size
    max_size                         = var.max_size
    min_size                         = var.min_size
}

module "integration" {
    count                           = var.integration ? 1 : 0
    source                          = "./modules/integration"
    vpc_id                          = var.vpc_id
    subnet_ids                      = var.subnet_ids
    load_balancer                   = format("http://%s:%s", var.load_balancer, var.load_balancer_port)
    swagger_file                    = var.swagger_file
}