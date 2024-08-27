module "network" {
  source = "./network"

  pj          = var.pj
  name        = var.name
  vpc-cidr    = var.vpc-cidr
  subnet-cidr = var.subnet-cidr
}

module "compute" {
  source = "./compute"

  pj                = var.pj
  name              = var.name
  app               = "dockerhost"
  type              = var.type
  vpc-id            = module.network.vpc-id
  subnet-id         = module.network.subnet-id
}