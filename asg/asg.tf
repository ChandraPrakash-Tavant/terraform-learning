resource "aws_launch_template" "app" {
  name_prefix = "tf-app-lt-"
  image_id = var.ami_id 
  instance_type = "t3.micro"
  key_name = var.key_name

  vpc_security_group_ids = var.security_group_ids 
  
  block_device_mapping {
   device_name = "/dev/sda1"
   ebs = {
     volume_size = 8 
     volume_type = "gp3"
     encypted = true
}
}
medadata_options {
http_tokens = "required"
http_endpoint = "enabled"
}

user_data = base64encode (<<-EOF 


