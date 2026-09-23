output "web_sg_id" { value = aws_security_group.web.id }
output "vpc_id" { value = data.aws_vpc.default.id }
