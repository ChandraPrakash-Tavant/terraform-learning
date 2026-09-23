output "volume_id" { value = aws_ebs_volume.data.id }
output "volume_size" { value = aws_ebs_volume.data.size }
output "device_name" { value = aws_volume_attachment.data.device_name }

