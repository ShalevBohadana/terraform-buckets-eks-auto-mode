provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "this" {
  for_each = local.bucket_map

  bucket = "${each.key}-${each.value.suffix}"

  # Encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Versioning
  versioning {
    enabled = true
  }

  # Tags
  tags = each.value.tags
}

# Enforce block-public-access separately if needed
resource "aws_s3_bucket_public_access_block" "this" {
  for_each = aws_s3_bucket.this

  bucket                  = each.value.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Optional outputs
output "bucket_ids" {
  value = aws_s3_bucket.this[*].id
}
output "bucket_arns" {
  value = aws_s3_bucket.this[*].arn
}
