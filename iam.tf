resource "aws_iam_role" "config" {
  name = "${var.name_prefix}-config-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      
      "Principal": {
        "Service": ["config.amazonaws.com"]
      },
      "Effect": "Allow"
      
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "config" {
  name = "${var.name_prefix}-config"
  role = "${aws_iam_role.config.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${data.aws_s3_bucket.config.arn}",
        "${data.aws_s3_bucket.config.arn}/*"
      ]
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "managed-policy" {
  name       = "aws-config-managed-policy"
  roles      = ["${aws_iam_role.config.name}"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}
