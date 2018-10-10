data "aws_s3_bucket" "config_s3_bucket" {
  bucket = "${var.aws_config_s3_bucket}"
}
