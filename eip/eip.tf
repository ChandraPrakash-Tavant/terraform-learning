resource "aws_eip" "app" {
  domain = "vpc"

  tags = {
    Name = "tf-app-eip"
  }
}

resource "aws_eip_association" "app" {
  instance_id   = var.instance_id
  allocation_id = aws_eip.app.id
}
