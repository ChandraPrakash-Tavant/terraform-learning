resource "aws_ecr_repository" "app" {
  name                 = "tf-app-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "tf-app-repository"
  }
}
