resource "aws_config_config_rule" "s3_bucket_sse_enabled" {
  count       = var.config_rule_s3_bucket_sse_enabled ? 1 : 0
  name        = "s3_bucket_server_side_encryption_enabled"
  description = "Checks whether your AWS S3 buckets have SSE enabled"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }

  depends_on = [
    aws_config_configuration_recorder.recorder,
    aws_config_delivery_channel.config,
  ]
}
