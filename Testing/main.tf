#create resoures for test environment
module "test-vpc" {
    source      = "../Modules/VPC"

    ENVIRONMENT = var.Env
    cidr= var.cidr
    AZ  = var.AZ
    AWS_REGION = var.AWS_REGION
    private_subnets = var.private_subnets
    public_subnets = var.public_subnets
    vpn_gateway = var.vpn_gateway
    NAT = var.NAT
}

module "test-instances" {
    source          = "../Modules/Instances"

    ENVIRONMENT     = var.Env
    AWS_REGION      = var.AWS_REGION 
    VPC_ID          = module.test-vpc.my_vpc_id
    PUBLIC_SUBNETS  = element(module.test-vpc.public_subnets,0)
    PRIVATE_SUBNETS  = element(module.test-vpc.private_subnets,1)
    public_key_path = var.public_key_path
    AMI             = var.AMI
    INSTANCE_TYPE   = var.INSTANCE_TYPE

}

provider "aws" {
  region = var.AWS_REGION
}