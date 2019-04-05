terraform {
  backend "s3" {}
}

provider "aws" {
  region = "${var.region}"

  profile = "${var.profile}"

  assume_role {
    role_arn = "${var.assume_role}"
  }

  version = "~> 1"
}
