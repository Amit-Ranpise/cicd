module "vpc" {
  source = "./module/vpc"
}
module "sg" {
    source = "./module/security_group"
    vpc_id = module.vpc.vpc_id
}
module "ec2" {
    source = "./module/ec2"
    sg_id = module.sg.sg_id
    vpc_id = module.vpc.vpc_id
    subnets = module.vpc.subnet_ids
}


