# -----------------------------------------------------------------------------
# Variables: Common AWS Provider - Autoloaded from Terragrunt
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars."
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars"
  type        = string
  default     = ""
}

variable "aws_assume_role_arn" {
  description = "(Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars."
  type        = string
  default     = ""
}

variable "aws_assume_role_session_name" {
  description = "(Optional) - The session name to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "aws_assume_role_external_id" {
  description = "(Optional) - The external ID to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "availability_zones" {
  description = "(Required) - The AWS avaialbility zones (e.g. ap-southeast-2a/b/c). Autoloaded from region.tfvars."
  type        = list(string)
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-AWS-API-GATEWAY 
# -----------------------------------------------------------------------------

variable "enabled" {
  description = "(Optional) -  A Switch that decides whether to create a terraform resource or run a provisioner. Default is true"
  type        = bool
  default     = true
}

variable "private_access_link" {
  description = "(Optional) -  A Switch that decides whether to create a internal network lb to provide provider access for the apigw to VPC resources. Default is false"
  type        = bool
  default     = false
}

// Resource: aws_iam_role
variable "description" {
  type        = string
  default     = "Managed by Terraform"
  description = "(Optional) - The description of the role."
}

variable "force_detach_policies" {
  description = "(Optional) -  _detach_policies - (Optional) Specifies to force detaching any policies the role has before destroying it. Defaults to false."
  type        = bool
  default     = true
}

variable "path" {
  type        = string
  default     = null
  description = "(Optional) - The path to the role. See IAM Identifiers for more information."
}

variable "max_session_duration" {
  type        = number
  default     = null
  description = "(Optional) - The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
}

variable "permissions_boundary" {
  type        = string
  default     = ""
  description = "(Optional) - The ARN of the policy that is used to set the permissions boundary for the role."
}




variable "subnet_ids" {
  description = "(Required) - List of subnets for the DB"
  default     = []
  type        = list(string)
}


variable "cloudwatch_event_rules" {
  description = "(Required) A list of objects that contain secrets information including `name`, `value`, and 'description'"
  type = list(object({
    name                = string
    description         = string
    schedule_expression = string
  }))
  default = []
}

variable "is_enabled" {
  description = "(Optional) Whether the rule should be enabled (defaults to true)."
  type        = bool
  default     = true
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-LABEL
# -----------------------------------------------------------------------------

variable "namespace" {
  type        = string
  default     = ""
  description = "(Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core'"
}

variable "environment" {
  type        = string
  default     = ""
  description = "(Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod'"
}

variable "name" {
  type        = string
  default     = ""
  description = "(Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "(Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "(Optional) - Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) - Additional tags"
}
