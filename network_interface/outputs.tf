output "eni_id" { value = aws_network_interface.secondary.id }
output "eni_private_ip" { value = aws_network_interface.secondary.private_ip }
output "eni_mac" { value = aws_network_interface.secondary.mac_address }
