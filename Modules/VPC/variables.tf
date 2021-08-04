variable "AZ"{
    default = ""
}

variable "AWS_REGION"{
    default = ""
}

variable "ENVIRONMENT"{
    default = ""
    type = string
}

variable "public_subnets" {
  default = ""
}

variable "private_subnets" {
  default = ""
  
}

variable "vpn_gateway"{
    default = ""
}

variable "NAT"{
    default = false
}

variable "cidr"{
    default = ""
}