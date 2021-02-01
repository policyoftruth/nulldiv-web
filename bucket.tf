resource "aws_s3_bucket" "www_bucket" {
  bucket = var.domain_name
  acl    = "private"
  policy = data.aws_iam_policy_document.www_policy.json
  versioning {
    enabled = true
  }
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "www_files" {
  bucket       = var.domain_name
  key          = "index.html"
  source       = "index.html"
  acl          = "private"
  content_type = "text/html"
  etag         = filemd5("index.html")
  depends_on = [
    aws_s3_bucket.www_bucket,
  ]
}
