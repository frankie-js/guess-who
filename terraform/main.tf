###########################################################
# LOCALS
###########################################################

locals {
  website_bucket_name = "guess-who-${random_string.suffix.result}"
}

###########################################################
# PROVIDER
###########################################################

provider "aws" {
  region  = var.region
  profile = var.profile

  default_tags {
    tags = local.tags
  }
}

provider "random" {}

###########################################################
# RESOURCES
###########################################################

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  numeric = false
  special = false
}

resource "aws_s3_bucket" "website" {
  bucket = local.website_bucket_name

  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.allow_public_access.json
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }
}
