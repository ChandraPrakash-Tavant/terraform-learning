output "db_endpoint" { value = aws_db_instance.app.endpoint }
output "db_name" { value = aws_db_instance.app.db_name }
output "db_sg_id" { value = aws_security_group.db.id }
