provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

resource "aws_cloudwatch_log_group" "dns_log_group" {
  provider = aws.us-east-1

  name              = "/aws/route53/${aws_route53_zone.myzone.name}"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_resource_policy" "dns_log_policy" {
  provider = aws.us-east-1

  policy_document = data.aws_iam_policy_document.dns_query_log_policy.json
  policy_name     = "dns-query-log-policy"
}
