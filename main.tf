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
  s3_bucket_name = "${aws_s3_bucket.config_bucket.bucket}"
  depends_on     = ["aws_config_configuration_recorder.recorder"]
  sns_topic_arn  = "${var.sns_topic_arn}"
}

resource "aws_config_configuration_recorder_status" "enable" {
  name       = "${aws_config_configuration_recorder.recorder.name}"
  is_enabled = true
  depends_on = ["aws_config_delivery_channel.config"]
}

resource "aws_s3_bucket" "config_bucket" {
  bucket        = "${var.customer}-${var.envname}-config"
  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "PutObjPolicy",
    "Statement": [
        {
            "Sid": "DenyIncorrectEncryptionHeader",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.customer}-${var.envname}-config/*",
            "Condition": {
                "StringNotEquals": {
                    "s3:x-amz-server-side-encryption": "AES256"
                }
            }
        },
        {
            "Sid": "DenyUnEncryptedObjectUploads",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.customer}-${var.envname}-config/*",
            "Condition": {
                "Null": {
                    "s3:x-amz-server-side-encryption": "true"
                }
            }
        }
    ]
}
POLICY
}
