resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "example" {
  bucket = "cloudtips-dev-${random_id.bucket_suffix.hex}"
}
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example_acl" {
  bucket = aws_s3_bucket.example.bucket

  acl = "private"
}

resource "aws_s3_bucket_public_access_block" "example_block" {
  bucket = aws_s3_bucket.example.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = false
}

