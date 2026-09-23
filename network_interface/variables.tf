variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "subnet_id" {
  type        = string
  description = "Subnet for ENI - must watch the instance's subnet "
}

variable "instance_id" {
  type        = string
  description = "Instance to  attach the ENI to "
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group for the ENI "
}

