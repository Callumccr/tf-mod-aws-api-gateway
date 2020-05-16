## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| availability\_zones | (Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars. | `list(string)` | n/a | yes |
| attributes | (Optional) - Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| aws\_account\_id | The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars | `string` | `""` | no |
| aws\_assume\_role\_arn | (Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars. | `string` | `""` | no |
| aws\_assume\_role\_external\_id | (Optional) - The external ID to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_assume\_role\_session\_name | (Optional) - The session name to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_region | The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars. | `string` | `""` | no |
| cloudwatch\_event\_rules | (Required) A list of objects that contain secrets information including `name`, `value`, and 'description' | <code><pre>list(object({<br>    name                = string<br>    description         = string<br>    schedule_expression = string<br>  }))<br></pre></code> | `[]` | no |
| delimiter | (Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| description | The description of the role. | `string` | `"(Optional) - Managed by Terraform"` | no |
| enabled | (Optional) -  A Switch that decides whether to create a terraform resource or run a provisioner. Default is true | `bool` | `true` | no |
| environment | (Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod' | `string` | `""` | no |
| force\_detach\_policies | (Optional) -  \_detach\_policies - (Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to false. | `bool` | `true` | no |
| is\_enabled | (Optional) Whether the rule should be enabled (defaults to true). | `bool` | `true` | no |
| max\_session\_duration | (Optional) - The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours. | `string` | `""` | no |
| name | (Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline' | `string` | `""` | no |
| namespace | (Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core' | `string` | `""` | no |
| path | (Optional) - The path to the role. See IAM Identifiers for more information. | `string` | `""` | no |
| permissions\_boundary | (Optional) - The ARN of the policy that is used to set the permissions boundary for the role. | `string` | `""` | no |
| subnet\_ids | (Required) - List of subnets for the DB | `list(string)` | `[]` | no |
| tags | (Optional) - Additional tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudwatch\_event\_rule\_arns | The Amazon Resource Name (ARN) of the rule. |
| cloudwatch\_event\_rule\_ids | The name of the rule. |

