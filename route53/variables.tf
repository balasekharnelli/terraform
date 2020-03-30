variable "domain_name" {
    default = "abc.com"
}

variable "region" {
    default = "us-east-1"
}

variable "force_destroy" {
    type = bool
    default = true
}

variable "comment" {
    default = "Public Hosted Zone"
}

variable "region_tag" {
    type = map(string)
    default = {
        us-east-1 = "use1"
        us-east-2 = "use2"
        us-west-1 = "usw1"
        us-west-2 = "usw2"
    }
}