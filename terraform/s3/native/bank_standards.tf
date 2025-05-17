# Build a base list of bucket names + tags
locals {
  buckets = [
    for i in range(1, var.bucket_count + 1) : {
      name = "app-bucket-${i}"
      tags = merge(var.default_tags, {
        Purpose = "bucket-${i}"
      })
    }
  ]
}

# Unique suffixes
resource "random_id" "suffix" {
  count       = var.bucket_count
  byte_length = 4
}

# Merge suffix back into each bucket spec
locals {
  bucket_map = {
    for idx, b in local.buckets :
    b.name => merge(b, { suffix = random_id.suffix[idx].hex })
  }
}
