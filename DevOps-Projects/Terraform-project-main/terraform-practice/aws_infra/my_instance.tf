resource "aws_instance" "my-instance" {
  count = var.instance_count
  ami = var.ami_id
  instance_type = var.instance_type
  tags = {
    name = "${var.my-env}-terra_automate-instance"
  }
}
