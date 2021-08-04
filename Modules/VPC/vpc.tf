#Custom VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"

  name  = "yanshul-vpc-${var.ENVIRONMENT}"
  cidr  = var.cidr

  azs             = ["${var.AWS_REGION}a", "${var.AWS_REGION}b"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  enable_vpn_gateway = var.vpn_gateway
  enable_nat_gateway = var.NAT

  tags = {
    "Terraform" = "yanshul-${var.ENVIRONMENT}"
  }

  public_subnet_tags = tomap({
    "Name"= "${var.ENVIRONMENT}-public-subnet"
  })

  private_subnet_tags = tomap({
    "Name"= "${var.ENVIRONMENT}-private-subnet"
  })
}

#Output Specific to Custom VPC
output "my_vpc_id" {
  description = "VPC-ID"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}