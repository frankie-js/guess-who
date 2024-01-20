###########################################################
# OUTPUTS
###########################################################

output "website_bucket_name" {
  value = local.website_bucket_name
}

output "website_bucket_url" {
  value = "http://${local.website_bucket_name}.s3-website-us-east-1.amazonaws.com "
}
