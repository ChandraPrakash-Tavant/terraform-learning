variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "source_instance_id" {
  type        = string
  description = "Instance to bake the AMI from"
}


