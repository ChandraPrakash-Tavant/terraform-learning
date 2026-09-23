resource "aws_network_interface" "secondary" {
  subnet_id       = var.subnet_id
  security_groups = var.security_group_ids
  description     = "Secondary network interface"

  tags = {
    Name = "tf-secondary-eni"
  }
}

resource "aws_network_interface_attachment" "secondary" {
  instance_id          = var.instance_id
  network_interface_id = aws_network_interface.secondary.id
  device_index         = 1
}
