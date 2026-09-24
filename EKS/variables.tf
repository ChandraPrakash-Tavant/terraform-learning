variable "region" {
  default = "ap-south-1"
}

variable "subnet_ids" {
  type        = list(string)
  description = "At least two subnets in different AZs"
}
