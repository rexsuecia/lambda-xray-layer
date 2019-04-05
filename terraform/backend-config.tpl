# Replase the values in this file with the ones relevant for your
# AWS environmnet then save it as backend-config.conf
#
# Remember: terraform init -backend-config=backend-config.conf

# This is the only thing that changes between environments.
key              = "The key you use in your terraform bucket (e.g. lambda/states/my-layer"

bucket           = "The bucket where you store your states (e.g. my-states-terraform"
dynamodb_table   = "The DynamoDB table you use for state locking (e.g my-states-lock)"
region           = "Your AWS region of choice (e.g eu-west-1)"
profile          = "The AWS profile from where credentials should be fetched, because you do not use default!"
role_arn         = "If you need to assume a specific role e.g. arn:aws:iam::12345678910:role/DEVELOPER_TERRAFORM_ROLE"
encrypt          = true (leave this as true, bc you want to encrypt)
acl              = "bucket-owner-full-control" (Use this when you use a shared account)
