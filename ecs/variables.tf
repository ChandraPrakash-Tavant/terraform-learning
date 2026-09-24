variable "region" {
  default = "ap-south-1"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets to run the ECS task in"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security groups for the ECS task ENI"
}

variable "container_image" {
  type        = string
  description = "Image to run - use a public one until you push to ECR"
  default     = "public.ecr.aws/nginx/nginx:latest"
}

variable "container_port" {
  type    = number
  default = 80
}
