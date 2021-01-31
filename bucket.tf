resource "aws_s3_bucket" "www_bucket" {
  bucket = var.domain_name
  acl    = "public-read"
  policy = data.aws_iam_policy_document.www_policy.json
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "www_files" {
  bucket       = var.domain_name
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
  depends_on = [
    aws_s3_bucket.www_bucket,
  ]
}
