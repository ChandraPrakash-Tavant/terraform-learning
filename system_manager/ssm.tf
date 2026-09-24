# --- Part A: IAM role so EC2 can talk to SSM ---

data "aws_iam_policy_document" "assume_ec2" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ssm_role" {
  name               = "tf-ssm-role"
  assume_role_policy = data.aws_iam_policy_document.assume_ec2.json

  tags = {
    Name = "tf-ssm-role"
  }
}

resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "tf-ssm-profile"
  role = aws_iam_role.ssm_role.name
}

# --- Part B: Parameter Store ---

resource "aws_ssm_parameter" "app_env" {
  name  = "/tf-app/environment"
  type  = "String"
  value = "dev"

  tags = {
    Name = "tf-app-env"
  }
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/tf-app/db_password"
  type  = "SecureString"
  value = "ChangeMe123!"

  tags = {
    Name = "tf-app-db-password"
  }
}
