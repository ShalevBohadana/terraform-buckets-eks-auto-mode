provider "aws" {
  region = var.region
}

module "bucket_b" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.0.0"

  bucket = var.bucket_b_name

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  tags = var.tags
}
