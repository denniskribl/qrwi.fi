resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  policy = data.aws_iam_policy_document.this.json

  tags   = {
    Name = var.bucket_name
  }

}
