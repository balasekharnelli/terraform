locals {
  common_tags = {
    user_name = "Balasekhar"
    contact_number = "9090909090"
    Region = var.region
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0ce21b51cb31a48b8"
  instance_type = "t2.micro"

  tags = merge(local.common_tags, {Owner = "${var.region}-nbs"}, {Location_tag = lookup(var.region_tag, var.region)})
}