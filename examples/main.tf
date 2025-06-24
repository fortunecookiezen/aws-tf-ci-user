module "ci_user" {
  source                  = "github.com/fortunecookiezen/aws-tf-ci-user"
  name                    = "ci-user"
  path                    = "/ci/"
  ci_user_policy_document = data.aws_iam_policy_document.demo.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AWSCodeCommitPowerUser",
    "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess",
    "arn:aws:iam::aws:policy/AWSCodePipeline_FullAccess",
    "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess",
    "arn:aws:iam::aws:policy/AWSLambda_FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
  ]
  tags = {
    Environment = "nonprod"
  }
}

data "aws_iam_policy_document" "demo" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:CreateTags"
    ]
    resources = ["*"]
  }
}