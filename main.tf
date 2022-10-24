#---root/main.tf---

terraform {
  backend "s3" {
    bucket = "final-project-week24-bucket"
    key    = "state/terraform.tfstate"
    region = "us-west-2"
  }
}

module "networking" {
  source       = "./networking"
  main         = var.main
  vpc_cidr     = var.vpc_cidr
  public_cidrs = [for i in range(2, 255, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  access_ip    = var.access_ip
}


module "ec2-autoscaling" {
  source        = "./ec2-autoscaling"
  instance_type = var.instance_type
  image_id      = var.image_id
  key_name      = var.key_name
  #   public_sg        = module.networking.public_sg
  web_sg = module.networking.web_sg
  public_subnet    = module.networking.public_subnet
  load_balancer    = module.loadbalancer.load_balancer
  target_group_arn = module.loadbalancer.target_group_arn
  main             = var.main

}

module "loadbalancer" {
  source          = "./loadbalancer"
  vpc_id          = module.networking.vpc_id
  public_subnet   = module.networking.public_subnet
  main            = var.main
  web_sg          = module.networking.web_sg
  # loadbalancer-sg = module.networking.loadbalancer-sg
}
