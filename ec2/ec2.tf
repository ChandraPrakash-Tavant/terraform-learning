resource "aws_instance" "app" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t3.micro"
  key_name      = "maven"
  subnet_id     = var.subnet_id

  tags = {
    Name = "tf-app-server"
  }
}
