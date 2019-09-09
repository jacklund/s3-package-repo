resource "aws_iam_policy" "s3_ro_policy" {
  name        = "s3_ro_policy"
  description = "Read-only access to S3 bucket"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.aptly_repo_bucket.arn}"
    }
  ]
}
EOF
}
