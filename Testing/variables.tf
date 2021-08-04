variable "AWS_ACCESS_KEY" {
    type = string
    default = ""
}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION"{
    default = "ap-south-1"
}

variable "AZ"{
    default = "ap-south-1a"
}

variable "Env"{
    default = "Test"
    type = string
}

variable "public_key_path" {
  description = "Public key path"
  default = "/home/ubuntu/terraform_project/Testing/terraform.pub"
}

variable "AMI" {
    type = string
    default = "ami-04db49c0fb2215364"
}

variable "INSTANCE_TYPE" {
  default = "t3.medium"
}

variable "cidr"{
default = "172.16.0.0/16"
}

variable "public_subnets" {
  default = ["172.16.3.0/24", "172.16.4.0/24"]
  type    = list
}

variable "private_subnets" {
  default = ["172.16.1.0/24", "172.16.2.0/24"]
  type    = list
}

variable "vpn_gateway"{
    default = false
}

variable "NAT"{
    default = false
}
