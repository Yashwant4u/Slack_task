resource "aws_instance" "secret_key_task" {
  ami                  = "ami-0c768662cc797cd75 "
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.secrettaskprofile.name

  tags = {
    Name = "Secret_Task"
  }
}
