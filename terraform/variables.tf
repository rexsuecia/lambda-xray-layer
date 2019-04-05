variable "region" {
  description = "In what region do we deploy"
  # "eu-west-1"
}

variable "assume_role" {
  description = "The role ARN to assume when appplying terraforms."
  # arn:aws:iam::<account-number-without-hyphens>:role/<RoleName>
}

variable "account_number" {
  description = "The account number to use"

  # 12345670910
}

variable "profile" {
  description = "The profile of your AWS credentials to use, because you are not using default"
}