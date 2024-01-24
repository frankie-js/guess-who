###########################################################
# OUTPUTS
###########################################################

output "website_bucket_name" {
  value = aws_s3_bucket.website.id
}

output "website_bucket_url" {
  value = "http://${aws_s3_bucket.website.id}.s3-website-${var.region}.amazonaws.com"
}
