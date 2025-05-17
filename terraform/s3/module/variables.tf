variable "region" {
  type    = string
  default = "us-west-2"
}

variable "bucket_b_name" {
  description = "Name of the S3 bucket B (module)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to bucket"
  type        = map(string)
  default     = {
    Environment = "dev"
    Owner       = "your-team"
  }
}
