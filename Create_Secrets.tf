variable "secrettaskvar" {
  default = {
    access_key_sh        = ""
    secret_access_key_sh = " "
  }

  type = map(string)
}

resource "aws_secretsmanager_secret" "shezadsecret" {
  name = "shezadsecret"
}

resource "aws_secretsmanager_secret_version" "secretversion" {
  secret_id     = aws_secretsmanager_secret.shezadsecret.id
  secret_string = jsonencode(var.secrettaskvar)
}
