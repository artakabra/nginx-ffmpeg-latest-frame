module "network" {
  source   = "./modules/network"
  vpc_cidr = var.vpc_cidr
  az       = var.az
}

module "compute" {
  source        = "./modules/compute"
  vpc_id        = module.network.vpc_id
  subnet_id     = module.network.public_subnet_id
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}