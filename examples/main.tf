module "ci_user" {
  source = "../../modules/ci-user"
  name   = "ci-user"
  path   = "/ci/"
  tags = {
    Environment = "nonprod"
  }
}
