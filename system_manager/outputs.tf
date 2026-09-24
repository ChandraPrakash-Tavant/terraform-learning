output "instance_profile_name" { value = aws_iam_instance_profile.ssm_profile.name }
output "ssm_role_arn" { value = aws_iam_role.ssm_role.arn }
output "app_env_param" { value = aws_ssm_parameter.app_env.name }
output "db_password_param" { value = aws_ssm_parameter.db_password.name }
