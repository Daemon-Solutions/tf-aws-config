// resource name variables
variable "name_prefix" {}

variable "s3_bucket_name" {}

// aws config settings
variable "config_max_execution_frequency" {
  description = "The maximum frequency with which AWS Config runs evaluations for a rule"
  default     = "TwentyFour_Hours"
  type        = string
}

variable "recording_group_all_supported" {
  default = true
}

variable "recording_group_include_global_resource_types" {
  default = true
}

variable "sns_topic_arn" {
  description = "SNS topic ARN for notifcations"
  default     = ""
}

// aggregators
variable "aggregate_config_data" {
  description = "Boolean indicating whether AWS Config should aggregate config data from source AWS Account IDs"
  type        = string
  default     = false
}

variable "aggregator_source_account_ids" {
  description = "List of source AWS account IDs being aggregated"
  type        = list
  default     = []
}

variable "aggregator_source_account_names" {
  description = "List of source environment names i.e. dev/sit/prod for the configuration aggregator"
  type        = list
  default     = []
}

variable "aggregator_regions" {
  description = "List of source regions being aggregated"
  type        = list
  default     = []
}

// config rule - guardduty enabled policy
variable "config_rule_guardduty_enabled" {
  default = false
}

// config rule - cloudtrail enabled policy
variable "config_rule_cloudtrail_enabled" {
  default = false
}

// config rule - root mfa enabled policy
variable "config_rule_root_mfa_enabled" {
  default = false
}

// config rule - s3 bucket sse
variable "config_rule_s3_bucket_sse_enabled" {
  default = false
}

// config rule - iam password policy
variable "config_rule_iam_password_policy_enabled" {
  default = false
}

variable "password_require_uppercase" {
  description = "Require at least one uppercase character in password."
  default     = true
}

variable "password_require_lowercase" {
  description = "Require at least one lowercase character in password."
  default     = true
}

variable "password_require_symbols" {
  description = "Require at least one symbol in password."
  default     = true
}

variable "password_require_numbers" {
  description = "Require at least one number in password."
  default     = true
}

variable "password_min_length" {
  description = "Password minimum length."
  default     = 14
}

variable "password_reuse_prevention" {
  description = "Number of passwords before allowing reuse."
  default     = 24
}

variable "password_max_age" {
  description = "Number of days before password expiration."
  default     = 90
}
