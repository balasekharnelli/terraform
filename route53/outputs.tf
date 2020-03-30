output "zone_id" {
    value = list(aws_route53_zone.primary.id)
}

#####################################################

output "name_servers_0" {
    description = "Without any function"
    value = aws_route53_zone.primary.*.name_servers
}


# Ouput:
# name_servers_0 = [
#   [
#     "ns-1058.awsdns-04.org",
#     "ns-1850.awsdns-39.co.uk",
#     "ns-22.awsdns-02.com",
#     "ns-815.awsdns-37.net",
#   ],
# ]

#####################################################

output "name_servers_1" {
    description = "With concat function "
    value = concat(aws_route53_zone.primary.*.name_servers, list(""))
}

#####################################################
output "name_servers_01" {
    description = "With element function "
    value = element(aws_route53_zone.primary.*.name_servers, 0)
}

# Output:
# name_servers_1 = [
#   [
#     "ns-1058.awsdns-04.org",
#     "ns-1850.awsdns-39.co.uk",
#     "ns-22.awsdns-02.com",
#     "ns-815.awsdns-37.net",
#   ],
#   "",
# ]
#####################################################


output "name_servers_2" {
    description = "With element and concat"
    value = concat(aws_route53_zone.primary.*.name_servers, list("Bala","sekhar"))
}

# Output:
# name_servers_2 = [
#   [
#     "ns-1058.awsdns-04.org",
#     "ns-1850.awsdns-39.co.uk",
#     "ns-22.awsdns-02.com",
#     "ns-815.awsdns-37.net",
#   ],
#   "Bala",
#   "sekhar",
# ]

#####################################################

output "name_servers_3" {
    value = "${element(concat(aws_route53_zone.primary.*.name_servers, list("")), 0)}"
}

output "name_servers_4" {
    value = flatten(aws_route53_zone.primary.*.name_servers)
}


######################################################################

variable "name" {
    type = list
    default = ["Bala", "Sekhar"]
}

######################################################################
output "myNameList" {
    value = list("Nelli", "Balasekhar")
}

# Output:
# myNameList = ["Nelli","Balasekhar",]


output "myName" {
    value = concat(list("Nelli", "Chintu"), var.name)
}

######################################################################
output "concatResult" {
    value = concat([["ns-1058.awsdns-04.org","ns-1850.awsdns-39.co.uk","ns-22.awsdns-02.com","ns-815.awsdns-37.net"],],list("Nelli", "Balasekhar"))
}

# Output:

# concatResult = [
#   [
#     "ns-1058.awsdns-04.org",
#     "ns-1850.awsdns-39.co.uk",
#     "ns-22.awsdns-02.com",
#     "ns-815.awsdns-37.net",
#   ],
#   "Nelli",
#   "Balasekhar",
# ]

#concat(["a", ""], ["b", "c"]  => ["a","","b","c",]

#############################
# for loop
#############################
output "concatResult_for_loop" {
    value = [for item in flatten(concat(aws_route53_zone.primary.*.name_servers,list("Nelli", "Balasekhar"))): upper(item)]
}