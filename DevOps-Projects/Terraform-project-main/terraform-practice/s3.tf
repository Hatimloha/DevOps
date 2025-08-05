resource "aws_s3_bucket" "my_bucket" {
  #args
  bucket = "tws-free-devops-bootcamp"
  tags = {
    name = "tws-free-devops-bootcamp"
  }
}