provider "aws" {
    region = "${var.region}"
    access_key = "xxxxxxxxxxxxxxxxxxxxxx"
    secret_key = "xxxxxxxxxxxxxxxxxxxxxx"
}

variable "env" {
  default = "prod"
}

resource "aws_vpc" "my_vpc" {
    count = "${var.env == "prod" ? 1 : 0}"
    cidr_block = "10.2.0.0/16"
    instance_tenancy = "default"

    tags {
        Name = "my_vpc"
        AppName = "MyApp"
    }
}
