variable "region" {
  default = "ap-south-1"
}

variable "instance_id" {
  type        = string
  description = "Existing instance to attach the SSM role to"
}
