variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "availability_zone" {
  type        = string
  description = "Must match the AZ of the instance you attach to"
  default     = "ap-south-1a"
}

variable "instance_id" {
  type        = string
  description = "Instance to attach the volume to"
}
