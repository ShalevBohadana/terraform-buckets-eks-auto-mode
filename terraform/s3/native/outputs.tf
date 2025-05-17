output "bucket_a_id" {
  value = aws_s3_bucket.bucket_a.id
}

output "bucket_a_arn" {
  value = aws_s3_bucket.bucket_a.arn
}
output "bucket_ids" {
  value = aws_s3_bucket.this[*].id
}
