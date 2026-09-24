variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_id" {
  type        = string
  description = "VPC for RDS"
}

variable "subnet_ids" {
  type        = list(string)
  description = "At least two subnets in different AZs"
}

variable "app_security_group_id" {
  type        = string
  description = "SG allowed to reach the DB (your web SG for testing)"
}

variable "db_username" {
  type    = string
  default = "dbadmin"
}

variable "db_password" {
  type      = string
  sensitive = true
}
