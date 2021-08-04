variable "AWS_REGION"{
    default = "ap-south-1"
}

variable "AZ"{
    default = ""
}

variable "ENVIRONMENT"{
    default = ""
    type = string
}

variable "public_key_path" {
  description = "Public key path"
  default = ""
}

variable "VPC_ID" {
    type = string
    default = ""
}

variable "AMI" {
    type = string
    default = ""
}

variable "INSTANCE_TYPE" {
  default = ""
}

variable "PUBLIC_SUBNETS" {
  default= ""
}

variable "PRIVATE_SUBNETS" {
  default= ""
}