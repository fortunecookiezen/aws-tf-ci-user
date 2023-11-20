module "ci_user" {
  source = "../../modules/ci-user"
  name   = "ci-user"
  tags = {
    Environment = "nonprod"
  }
}
