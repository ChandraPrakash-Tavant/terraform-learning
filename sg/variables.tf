variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "my_ip_cidr" {
  type        = string
  description = "Your IP in CIDR form the SSH"
  default     = "0.0.0.0/0"
}


