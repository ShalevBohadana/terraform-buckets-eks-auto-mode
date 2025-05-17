variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "bucket_count" {
  description = "How many buckets to create"
  type        = number
  default     = 2
}

# any other vars you had, e.g. tags, suffix length, etc.
variable "default_tags" {
  description = "Base tags applied to every bucket"
  type        = map(string)
  default = {
    Environment = "dev"
    Owner       = "your-team"
  }
}
