data "aws_s3_bucket" "config" {
  bucket = "${var.s3_bucket_name}"
}

data "aws_kms_alias" "s3" {
  name = "alias/aws/s3"
}