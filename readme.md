tf-aws-config
==========================

This module is for implementing AWS Config within a region. The module is currently configured with 5 AWS Managed rules. These can be expanded upon easily by referencing the list of managed rules on the following url:-

https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html


The iam-password-policy rule is an example of sending paramaters in the rule via a rendered json template. If you wish to add a rule that allows additional parameters then use this as a reference.


Usage
-----

Declare a module in your Terraform file, for example:

  `module "aws_config`

  `source                                   = "../localmodules/tf-aws-config"`
    
  `name_prefix                              = "${var.envtype}-${var.envname}"`

  `aggregate_config_data                    = true`

  `aggregator_source_account_names          = ["${keys(var.aws_accounts)}"]`
  
  `aggregator_source_account_ids            = ["${values(var.aws_accounts)}"]`
  
  `aggregator_regions                       = ["${var.aws_region}"]`
  
  `s3_bucket_name                           = "eu_west_1_config_bucket"`
  
  `sns_topic_arn                            = "arn:aws:sns:eu-west-1:483560084512:test-arn_name"`

  `config_rule_guardduty_enabled            = true`

  `config_rule_cloudtrail_enabled           = true`

  `config_rule_root_mfa_enabled             = true`
  
  `config_rule_iam_password_policy_enabled  = true`
  
  `config_rule_s3_bucket_sse_enabled        = true`  
  `}`
}


Variables (Default in brackets)
---------

- `name_prefix`                                     - name prefix of resources

- `aggregate_config_data`                           - Boolean indicating whether AWS Config should aggregate config data from source AWS Account IDs [Default: false]

- `aggregator_source_account_names`                 - names of aggregator sources. Individual aggregator sources created based on each name provided [Default: [] ]
  
- `aggregator_source_account_ids`                   - aws account id's of aggregator sources. Each aggregator source requires an account id and must match account name provided [Default: []]
  
- `aggregator_regions`                              - aws regions required      

- `s3_bucket_name`                                  - name of config s3 bucket 

- `sns_topic_arn`                                   - SNS topic ARN for notifcations

- `config_max_execution_frequency`                  - The maximum frequency with which AWS Config runs evaluations for a rule 

- `recording_group_all_supported`                   - record all resource types (true)

- `recording_group_include_global_resource_types`   - record global resource types (true

- `config_rule_guardduty_enabled`                   - Boolean to monitor if centralized GuardDuty is enabled (disabled)

- `config_rule_cloudtrail_enabled`                  - Boolean to monitor if Cloudtrail is enabled (disabled)

- `config_rule_root_mfa_enabled`                    - Boolean to monitor if centralized GuardDuty is enabled (disabled)

- `config_rule_s3_bucket_sse_enabled`               - Boolean to monitor if S3 SSE is enabled (disabled)

- `iam_password_policy_enabled`                     - Boolean to monitor Iam password policy (Parameters below)

- `password_require_uppercase`                      - Require at least one uppercase character in password (true)

- `password_require_lowercase`                      - Require at least one lowercase character in password (true)

- `password_require_symbols`                        - Require at least one symbol in password (true)

- `password_require_numbers`                        - Require at least one number in password (true)

- `password_min_length`                             - Password minimum length (14)

- `password_reuse_prevention`                       - Number of passwords before allowing reuse (24)

- `password_max_age`                                - Number of days before password expiration (90)