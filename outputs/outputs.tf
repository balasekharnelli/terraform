variable "name" {
  description = "A sample list of names"
  type    = list(string)
  default = ["apple", "mango", "orange"]
}

output "upper_names_1" {
    value = [for name in var.name: upper(name)]
}

output "upper_names_2" {
  value = [for name in var.name: length(name)<0 ? upper(name) : title(name)]
}

