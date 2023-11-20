module "ci_user" {
  source = "github.com/fortunecookiezen/aws-tf-ci-user"
  name   = "ci-user"
  path   = "/ci/"
  tags = {
    Environment = "nonprod"
  }
}
