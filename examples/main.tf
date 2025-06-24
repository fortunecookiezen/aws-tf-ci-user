module "ci_user" {
  source = "github.com/fortunecookiezen/aws-tf-ci-user"
  name   = "ci-user"
  path   = "/ci/"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AWSCodeCommitPowerUser",
    "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess",
    "arn:aws:iam::aws:policy/AWSCodePipelineFullAccess",
    "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess",
    "arn:aws:iam::aws:policy/AWSLambda_FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
  ]
  tags = {
    Environment = "nonprod"
  }
}
