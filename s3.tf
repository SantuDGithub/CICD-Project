resource "aws_s3_bucket" "bucklebuck" {
  bucket = "my-Terraform-bucket"
  acl    = "private"

  tags = {
    Name        = "Dilip-Kumar-J"
    Environment = "Dev"
  }
}
