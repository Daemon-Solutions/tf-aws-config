resource "aws_config_config_rule" "guard_duty_rule" {
  count       = "${var.guardduty_enabled}"
  name        = "centralised-guardduty-enabled"
  description = "Checks whether Amazon GuardDuty is enabled in your AWS account and region"

  source {
    owner             = "AWS"
    source_identifier = "GUARDDUTY_ENABLED_CENTRALIZED"
  }

  depends_on = [
    "aws_config_configuration_recorder.recorder",
    "aws_config_delivery_channel.config",
  ]
}
