resource "aws_ebs_snapshot" "data" {
  volume_id   = var.volume_id
  description = "Snapshot of tf-data-volume"

  timeouts {
    create = "30m"
    delete = "30m"
  }

  tags = {
    Name = "tf-data-snapshot"
  }
}
