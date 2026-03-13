resource "aws_s3_bucket" "my-s3-example" {
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}