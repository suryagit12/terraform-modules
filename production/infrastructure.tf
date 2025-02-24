module "prod_vpc_1" {
  source             = "../modules/network"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  environment        = var.environment
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  azs                = var.azs
  natgw_id = module.prod_natgw_1.natgw_id
}


module "prod_natgw_1" {
  source        = "../modules/nat"
public_subnet_id = module.prod_vpc_1.public_subnets_id_1
vpc_name = module.prod_vpc_1.vpc_name
}
