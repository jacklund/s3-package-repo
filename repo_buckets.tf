resource "aws_s3_bucket" "aptly_repo_bucket" {
  bucket = "aptly-repository"
  acl    = "public-read"

  versioning {
    enabled = true
  }
}
