provider "aws" {
  region = var.region
}

module "stack" {
  source = "../../"

  vpc_cidr      = var.vpc_cidr
  az            = var.az
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}
