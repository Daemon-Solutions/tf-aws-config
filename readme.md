tf-aws-config
==========================

This module is for implementing AWS Config within a region. The module is currently configured with 5 AWS Managed rules. These can be expanded upon easily by referencing the list of managed rules on the following url:-

https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html


The iam-password-policy rule is an example of sending paramaters in the rule via a rendered json template. If you wish to add a rule that allows additional parameters then use this as a reference.


Usage
-----

Declare a module in your Terraform file, for example:

  `module "aws_config`

  `source = "../localmodules/tf-aws-config"`
  
  `customer = "${var.customer}"`
  
  `envname  = "${var.envname}"`

  `guardduty_enabled                        = "1"`

  `cloudtrail_enabled                       = "1"`

  `root_mfa_enabled                         = "1"`
  
  `iam_password_policy_enabled              = "1"`
  
  `s3_bucket_server_side_encryption_enabled = "1"`
  
  `sns_topic_arn                            = "arn:aws:sns:eu-west-1:483560084512:test-arn_name"`
  
  `}`


}


Variables (Default in brackets)
---------

- `customer`           - name of customer

- `envname`            - name of environment

- `config_max_execution_frequency`                  - The maximum frequency with which AWS Config runs evaluations for a rule 

- `recording_group_all_supported`                   - record all resource types (true)

- `recording_group_include_global_resource_types`   - record global resource types (true

- `sns_topic_arn`                                   - SNS topic ARN for notifcations ("")

- `guardduty_enabled`                               - set to 1 to monitor if centralized GuardDuty is enabled (disabled)

- `cloudtrail_enabled`                              - set to 1 to monitor if Cloudtrail is enabled (disabled)

- `root_mfa_enabled`                                - set to 1 to monitor if centralized GuardDuty is enabled (disabled)

- `s3_bucket_server_side_encryption_enabled`        - set to 1 to monitor if S3 SSE is enabled (disabled)

- `iam_password_policy_enabled`                     - set to 1 to monitor Iam password policy (Parameters below)
- `password_require_uppercase`                      - Require at least one uppercase character in password (true)
- `password_require_lowercase`                      - Require at least one lowercase character in password (true)
- `password_require_symbols`                        - Require at least one symbol in password (true)
- `password_require_numbers`                        - Require at least one number in password (true)
- `password_min_length`                             - Password minimum length (14)
- `password_reuse_prevention`                       - Number of passwords before allowing reuse (24)
- `password_max_age`                                - Number of days before password expiration (90)










