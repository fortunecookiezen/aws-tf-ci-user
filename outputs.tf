output "ci_user_name" {
  description = "username of the user created by the module, defaults to 'ci-user'"
  value       = aws_iam_user.ci_user.name
}
output "ci_user_arn" {
  description = "arn of the user created by the module"
  value       = aws_iam_user.ci_user.arn
}
