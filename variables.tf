variable "ci_user_policy_document" {
  type        = string
  default     = ""
  description = "(Optional) json iam policy document describing permissions for ci user"
}
variable "name" {
  type        = string
  default     = "ci-user"
  description = "name for the ci-user, defaults to ci-user"
}
variable "path" {
  type        = string
  default     = "/"
  description = "path for the ci-user, defaults to /"
}
variable "kms_key_id" {
  type        = string
  default     = ""
  description = "(Optional) ARN or Id of the AWS KMS key to be used to encrypt the secret values in the versions stored in this secret."
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "common tags to use for all resources"
}
