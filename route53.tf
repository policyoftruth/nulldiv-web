resource "aws_route53_zone" "myzone" {
  name = var.domain_name
}

resource "aws_route53_record" "mypage" {
  zone_id = aws_route53_zone.myzone.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_s3_bucket.www_bucket.website_domain
    zone_id                = aws_s3_bucket.www_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}

output "my_name_servers" {
  value = aws_route53_zone.myzone.name_servers
}
