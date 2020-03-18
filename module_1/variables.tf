variable "region" {
  default = "us-west-2"
}

variable "vpc_cidr" {
  default = "190.168.0.0/16"
}

variable "subnet_cidr" {
  type = "list"
  default = ["190.168.1.0/24", "190.168.2.0/24", "190.168.3.0/24"]
}

#variable "azs" {
#  type = "list"
#  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
#}

data "aws_availability_zones" "azs" {}


variable "subnet_names" {
  type = "list"
  default = ["public-1","public-2","public-3"]
}

variable "ec2_ami" {
  default = "ami-7ad7c21e"
}






