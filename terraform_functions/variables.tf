variable "region" {
  default = "us-east-1"
  description = "Region to deploy the resources"
}


variable "region_tag" {
  type = map

  default = {
  us-east-1 = "use1"
  us-east-2 = "use2"
  us-west-1 = "usw1"
  us-west-2 = "usw2"
  }
}
