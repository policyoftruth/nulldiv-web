resource "aws_route53_zone" "myzone" {
  name = var.domain_name
}

resource "aws_route53_record" "mypage" {
  zone_id = aws_route53_zone.myzone.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.prod_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.prod_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "dvo" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.myzone.zone_id
}

resource "aws_route53_query_log" "dns_log_query" {
  depends_on = [aws_cloudwatch_log_resource_policy.dns_log_policy]

  cloudwatch_log_group_arn = aws_cloudwatch_log_group.dns_log_group.arn
  zone_id                  = aws_route53_zone.myzone.zone_id
}

output "my_name_servers" {
  value = aws_route53_zone.myzone.name_servers
}
