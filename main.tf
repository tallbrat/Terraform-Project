provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source   = "./vpc"
  vpc_cidr = var.vpc_cidr
}

module "internet_gateway" {
  source = "./internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "subnets" {
  source              = "./subnets"
  availability_zones  = var.availability_zones
  subnets_per_az      = var.subnets_per_az
}

module "nat_gateway" {
  source              = "./nat_gateway"
  availability_zones  = var.availability_zones
}

module "route_table" {
  source                      = "./route table"
  availability_zones          = var.availability_zones
  number-of-private-subnet    = var.number-of-private-subnet
  number-of-public-subnet     =  var.number-of-public-subnet
}
module "security_groups" {
  source                              = "./security_groups"
  no-of-public-instance-in-each-tier  = var.no-of-public-instance-in-each-tier
  no-of-private-instance-in-each-tier = var.no-of-private-instance-in-each-tier
}
module "ec2_instance" {
  source                              = "./compute/ec2_instance"
  availability_zones                  = var.availability_zones
  ami_id                              = var.ami_id
  instance_type                       = var.instance_type
  no-of-public-instance-in-each-tier  = var.no-of-public-instance-in-each-tier
  no-of-private-instance-in-each-tier = var.no-of-private-instance-in-each-tier
}