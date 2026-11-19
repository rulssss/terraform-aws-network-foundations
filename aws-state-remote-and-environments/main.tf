terraform {
  backend "s3" {
    bucket         = "rulss-terraform-state"
    key            = "network/terraform.tfstate"
    region         = "sa-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
    region = var.region
}

module "vpc" {
    source = "./modules/vpc"
    cidr_block = var.vpc_cidr
    project = var.project
    environment = var.environment 
}
# comentario de cambio test
module "subnets" {
    source = "./modules/subnets"
    vpc_id = module.vpc.vpc_id
    project = var.project
    public_subnet_1 = var.public_subnet_1
    public_subnet_2 = var.public_subnet_2
    private_subnet_1 = var.private_subnet_1
    private_subnet_2 = var.private_subnet_2
}

module "routing" {
    source = "./modules/routing"
    vpc_id = module.vpc.vpc_id
    public_subnet_ids = module.subnets.public_subnet_ids
    private_subnet_ids = module.subnets.private_subnet_ids
    project = var.project
    environment = var.environment
}

module "security-group" {
    source = "./modules/security-group"
    vpc_id = module.vpc.vpc_id
    project = var.project
}
