resource "aws_iam_user" "sh_user" {
  name = "sh_user"
  path = "/"
}

resource "aws_iam_access_key" "sh_user_access" {
  user = aws_iam_user.sh_user.name
}

output "access_key" {
  value = aws_iam_access_key.sh_user_access.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.sh_user_access.secret
  sensitive = true
}
