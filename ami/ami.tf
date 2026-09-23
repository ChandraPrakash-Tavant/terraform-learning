resource "aws_ami_from_instance" "app"{
	name= "tf-app-ami-v1"
	source_instance_id = var.source_instance_id
tags ={
	Name="tf-app-ami"
	}
}
