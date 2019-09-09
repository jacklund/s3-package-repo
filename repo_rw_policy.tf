resource "aws_iam_instance_profile" "s3_rw_profile" {
  name = "aptly-repo-rw-profile"
  role = "${aws_iam_role.s3_rw_role.name}"
}

resource "aws_iam_role" "s3_rw_role" {
  name = "s3_rw_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

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

resource "aws_iam_role_policy_attachment" "s3_rw_policy" {
  role       = "${aws_iam_role.s3_rw_role.name}"
  policy_arn = "${aws_iam_policy.s3_rw_policy.arn}"
}
