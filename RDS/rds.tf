resource "aws_db_subnet_group" "app" {
  name       = "tf-app-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "tf-app-db-subnet-group"
  }
}

resource "aws_security_group" "db" {
  name        = "tf-db-sg"
  description = "Allow Postgress only from app SG"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Postgres from the app tier "
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.app_security_group_id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "tf-db-sg"
  }
}
resource "aws_db_instance" "app" {
  identifier     = "tf-app-db"
  engine         = "postgres"
  engine_version = "15"
  instance_class = "db.t3.micro"

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = "appdb"
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.app.name
  vpc_security_group_ids = [aws_security_group.db.id]

  multi_az                = false
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 1
  deletion_protection     = false

  tags = {
    Name = "tf-app-db"
  }
}


