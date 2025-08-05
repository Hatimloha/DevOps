resource "aws_s3_bucket" "my_bucket" {
  #args
  bucket = "${var.my-env}-tws-free-devops-bootcamp"
  tags = {
    name = "${var.my-env}-tws-free-devops-bootcamp"
    environment = var.my-env
  }
}