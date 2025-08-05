# key pair

resource "aws_key_pair" "deployer" {
  key_name = "tws-terra-key"
  public_key = file("/root/terraform-project/Terraform-project/terraform-practice/terra-key.pub")
}

# Default VPS

resource "aws_default_vpc" "default" {
  
}

# Security key 

resource "aws_security_group" "twssecurity" {
  name = "allow ports"
  description = "this SG is to open ports for EC2 instance"
  vpc_id = aws_default_vpc.default.id #interpolation

  #incoming
  # Incoming
  ingress {
    description = "this is for SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  # outgoing
  egress {
    description = "outgoing rule"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "my-instance" {
  ami = var.ami_id
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.twssecurity.name]
  tags = {
    name = "terra_automate"
  }
}
