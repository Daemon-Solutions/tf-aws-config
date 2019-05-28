resource "aws_config_config_rule" "iam_password_policy" {
  count            = "${var.config_rule_iam_password_policy_enabled ? 1 : 0}"
  name             = "iam-password-policy"
  description      = "Ensure the account password policy for IAM users meets the specified requirements"
  input_parameters = "${data.template_file.aws_config_iam_password_policy.rendered}"

  source {
    owner             = "AWS"
    source_identifier = "IAM_PASSWORD_POLICY"
  }

  maximum_execution_frequency = "${var.config_max_execution_frequency}"

  depends_on = [
    "aws_config_configuration_recorder.recorder",
    "aws_config_delivery_channel.config",
  ]
}

data "template_file" "aws_config_iam_password_policy" {
  template = "${file("${path.module}/include/iam-password-policy.tpl")}"

  vars = {
    password_require_uppercase = "${var.password_require_uppercase ? "true" : "false"}"
    password_require_lowercase = "${var.password_require_lowercase ? "true" : "false"}"
    password_require_symbols   = "${var.password_require_symbols ? "true" : "false"}"
    password_require_numbers   = "${var.password_require_numbers ? "true" : "false"}"
    password_min_length        = "${var.password_min_length}"
    password_reuse_prevention  = "${var.password_reuse_prevention}"
    password_max_age           = "${var.password_max_age}"
  }
}
