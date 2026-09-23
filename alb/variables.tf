variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_id" {
  type        = string
  description = "VPC for the target grp"
}

variable "subnet_ids" {
  type        = list(string)
  description = "At least two subnets in different AZs"
}
variable "security_group_ids" {
  type        = list(string)
  description = "Security groups for the ALB"
}

variable "instance_id" {
  type        = string
  description = "Instance to register as a target"
}




