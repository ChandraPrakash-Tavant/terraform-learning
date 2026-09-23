variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "volume_id" {
  type        = string
  description = "EBS Volume to snapshot"
}


