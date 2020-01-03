data "aws_iam_policy_document" "this" {
  statement {
    actions = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.bucket_name}/*"]


    principals {
      type        = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
      ]
    }
  }
}

data "aws_route53_zone" "this" {
  name         = "qrwi.fi"
  private_zone = false
}
