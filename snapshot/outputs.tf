output "snapshot_id"   { value = aws_ebs_snapshot.data.id }
output "snapshot_size" { value = aws_ebs_snapshot.data.volume_size }
output "snapshot_arn"  { value = aws_ebs_snapshot.data.arn }
