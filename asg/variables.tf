variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets across at least two AZs"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security groups for the instances"
}

variable "target_group_arn" {
  type        = string
  description = "Target group to register instances into"
}

variable "ami_id" {
  type    = string
  default = "ami-0f918f7e67a3323f0"
}

variable "key_name" {
  type    = string
  default = "maven"
}
