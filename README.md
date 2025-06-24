# aws-tf-ci-user

## Description

This module creates an AWS IAM user for Continuous Integration use. It was built primarily with Gitlab CI in mind. Once you create the user the module, you will can retrieve the access key from the secretsmanager secret.

_CAUTION_ Because this module stores the key in an aws secretsmanager secret, it can be retrieved from your terraform state file. You must take steps, such as encrypting the terraform state file, to secure your state file. _This access key needs to be secured to prevent compromise!_

<!-- BEGIN_TF_DOCS -->


## Usage
```hcl
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
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >4.0 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ci_user_policy_document"></a> [ci\_user\_policy\_document](#input\_ci\_user\_policy\_document) | (Optional) json iam policy document describing permissions for ci user | `string` | `""` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | (Optional) ARN or Id of the AWS KMS key to be used to encrypt the secret values in the versions stored in this secret. | `string` | `""` | no |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | (Optional) list of managed policy ARNs to attach to the ci user | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | name for the ci-user, defaults to ci-user | `string` | `"ci-user"` | no |
| <a name="input_path"></a> [path](#input\_path) | path for the ci-user, defaults to / | `string` | `"/"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | common tags to use for all resources | `map(string)` | `{}` | no |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.ci_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.ci_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.managed_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_user.ci_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_secretsmanager_secret.ci_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_iam_policy_document.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ci_user_arn"></a> [ci\_user\_arn](#output\_ci\_user\_arn) | arn of the user created by the module |
| <a name="output_ci_user_name"></a> [ci\_user\_name](#output\_ci\_user\_name) | username of the user created by the module, defaults to 'ci-user' |

## Release Notes
```hcl
1.0 
Initial release of module. Future plans may be to restrict this user to PowerUser managed role.
```
<!-- END_TF_DOCS -->