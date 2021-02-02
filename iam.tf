data "aws_iam_policy_document" "www_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = [
      aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
      type = "AWS"
    }
    resources = ["arn:aws:s3:::${var.domain_name}/*"]
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${var.domain_name}"]
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }
}

data "aws_iam_policy_document" "dns_query_log_policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:log-group:/aws/route53/*"]

    principals {
      identifiers = ["route53.amazonaws.com"]
      type        = "Service"
    }
  }
}
