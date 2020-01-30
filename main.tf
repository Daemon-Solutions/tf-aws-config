resource "aws_config_configuration_recorder" "recorder" {
  name     = "${var.name_prefix}-recorder"
  role_arn = aws_iam_role.config.arn

  recording_group {
    all_supported                 = var.recording_group_all_supported
    include_global_resource_types = var.recording_group_include_global_resource_types
  }
}

resource "aws_config_delivery_channel" "config" {
  name           = "${var.name_prefix}-delivery-channel"
  s3_bucket_name = data.aws_s3_bucket.config.id
  depends_on     = [aws_config_configuration_recorder.recorder]
  sns_topic_arn  = var.sns_topic_arn
}

resource "aws_config_configuration_recorder_status" "enable" {
  name       = aws_config_configuration_recorder.recorder.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.config]
}

resource "aws_config_configuration_aggregator" "aggregators" {
  count = var.aggregate_config_data ? length(var.aggregator_source_account_names) : 0
  name  = element(var.aggregator_source_account_names, count.index)

  account_aggregation_source {
    account_ids = [element(var.aggregator_source_account_ids, count.index)]
    regions     = var.aggregator_regions
  }
}
