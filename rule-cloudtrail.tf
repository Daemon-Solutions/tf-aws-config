resource "aws_config_config_rule" "cloudtrail" {
  count       = var.config_rule_cloudtrail_enabled ? 1 : 0
  name        = "cloudtrail-enabled"
  description = "Checks whether AWS CloudTrail is enabled in your AWS account. "

  maximum_execution_frequency = var.config_max_execution_frequency

  source {
    owner             = "AWS"
    source_identifier = "CLOUD_TRAIL_ENABLED"
  }

  depends_on = [
    aws_config_configuration_recorder.recorder,
    aws_config_delivery_channel.config,
  ]
}
