provider "aws" {
  region = "${var.region}"
  access_key = "xxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxxxx"
}

resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags {
       Name = "Main"
       Location = "Bangalore"
  }
}

resource "aws_subnet" "subnets" {
    count = "${length(data.aws_availability_zones.azs.names)-1}"
    vpc_id = "${aws_vpc.main.id}"
    availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
    cidr_block = "${element(var.subnet_cidr, count.index)}"

    tags {
        Name = "${var.subnet_names[count.index]}-Subnet"
        alias_name = "${element(var.subnet_names, count.index)}"
    }
}
