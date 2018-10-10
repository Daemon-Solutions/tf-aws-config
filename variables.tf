/// resource name variables
variable "customer" {}

variable "envname" {}

/// aws config settings
variable "config_max_execution_frequency" {
  description = "The maximum frequency with which AWS Config runs evaluations for a rule"
  default     = "TwentyFour_Hours"
  type        = "string"
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

/// guardduty enabled policy
variable "guardduty_enabled" {
  default = "0"
}

/// cloudtrail enabled policy
variable "cloudtrail_enabled" {
  default = "0"
}

/// root mfa enabled policy
variable "root_mfa_enabled" {
  default = "0"
}

/// iam password policy
variable "iam_password_policy_enabled" {
  default = "0"
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

/// s3 sse enabled policy
variable "s3_bucket_server_side_encryption_enabled" {
  default = "0"
}

variable "aws_config_s3_bucket" {}

variable "s3_bucket_prefix" {
  default = ""
}
