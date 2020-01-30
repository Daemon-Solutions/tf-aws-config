resource "aws_config_config_rule" "root_account_mfa_enabled" {
  count       = var.config_rule_root_mfa_enabled ? 1 : 0
  name        = "root-account-mfa-enabled"
  description = "Checks whether users of your AWS account require a multi-factor authentication device to sign in with root credentials"

  maximum_execution_frequency = var.config_max_execution_frequency

  source {
    owner             = "AWS"
    source_identifier = "ROOT_ACCOUNT_MFA_ENABLED"
  }

  depends_on = [
    aws_config_configuration_recorder.recorder,
    aws_config_delivery_channel.config,
  ]
}
