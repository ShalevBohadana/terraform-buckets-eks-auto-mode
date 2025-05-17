module "vpc" {
  source  = "./vpc"
}

module "cluster" {
  source              = "./cluster"
  private_subnet_1_id = module.vpc.private_subnets[0]
  private_subnet_2_id = module.vpc.private_subnets[1]
  vpc_id              = module.vpc.vpc_id

}