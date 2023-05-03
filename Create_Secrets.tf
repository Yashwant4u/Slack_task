variable "secrettaskvar" {
  default = {
    access_key_sh        = "AKIARG6RSCXJTL2F4CWH"
    secret_access_key_sh = "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"
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
