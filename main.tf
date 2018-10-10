resource "aws_config_configuration_recorder" "recorder" {
  name     = "${var.customer}-${var.envname}-recorder"
  role_arn = "${aws_iam_role.config.arn}"

  recording_group = {
    all_supported                 = "${var.recording_group_all_supported}"
    include_global_resource_types = "${var.recording_group_include_global_resource_types}"
  }
}

resource "aws_config_delivery_channel" "config" {
  name           = "${var.customer}-${var.envname}-delivery-channel"
  s3_bucket_name = "${var.aws_config_s3_bucket}"
  depends_on     = ["aws_config_configuration_recorder.recorder"]
  sns_topic_arn  = "${var.sns_topic_arn}"
}

resource "aws_config_configuration_recorder_status" "enable" {
  name       = "${aws_config_configuration_recorder.recorder.name}"
  is_enabled = true
  depends_on = ["aws_config_delivery_channel.config"]
}
