output "s3_repo_rw_policy_arn" {
  value = "${aws_iam_policy.s3_rw_policy.arn}"
}

output "s3_repo_ro_policy_arn" {
  value = "${aws_iam_policy.s3_ro_policy.arn}"
}
