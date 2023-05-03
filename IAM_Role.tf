resource "aws_iam_role" "secret" {
  name = "secret_task"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_iam_role_policy_attachment" "awssecret" {
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
  role       = aws_iam_role.secret.name
}


resource "aws_iam_instance_profile" "secrettaskprofile" {
  name = "secretprofile"
  role = aws_iam_role.secret.name
}


