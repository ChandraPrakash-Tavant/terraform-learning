variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "environment" {
  type        = string
  description = "Environment prefix to keep the bucket name globally unique"
  default     = "dev"
}

