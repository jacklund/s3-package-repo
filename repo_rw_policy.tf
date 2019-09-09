resource "aws_iam_policy" "s3_rw_policy" {
  name        = "s3_rw_policy"
  description = "Read/Write access to S3 bucket"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.aptly_repo_bucket.arn}"
    }
  ]
}
EOF
}
