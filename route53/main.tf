resource "aws_route53_zone" "primary" {
   name = var.domain_name
   comment = var.comment
   force_destroy = var.force_destroy
   tags = {
       Name = "${var.region}-${lookup(var.region_tag, var.region, "use1")}"
   }
}
