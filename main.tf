provider "aws" {
    region =  "us-east.1"
}
 module "vpc" {
     source = "./modules/vpc"
     cidr_block = "10.0.0.0/16"
 }
 module "public_subnet" {
     source = "./modules/public_subnet"
     cidr_block = "10.0.1.0/24"
 }
 module "private_subnet" {
     source ="./modules/private_subnet"
     cidr_block = "10.0.2.0/24"
 }
 module "alb" {
    source ="./modules/alb"
    vpc_id = module.vpc.vpc_id
    subnet_ids = [module.public_subnet.subnet_id]
 }
 module "ec2" {
     source = "./modules/ec2"
     subnet_id = module.private_subnet.subnet_id
     alb_target_group-arn = module.alb.target_group_arn
 }
 module "rds" {
     source = "./modules/rds"
     subnet_id = module.private_subnet.subnet_id
 }