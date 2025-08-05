module "dev-app" {
  source = "./aws_infra"
  my-env = "dev"
  instance_type = "t2.micro"
  ami_id = "ami-0e53db6fd757e38c7"
  instance_count =  1
}


module "stg-app" {
  source = "./aws_infra"
  my-env = "stg"
  instance_type = "t2.micro"
  ami_id = "ami-0e53db6fd757e38c7"
  instance_count =  1
}


module "prd-app" {
  source = "./aws_infra"
  my-env = "prd"
  instance_type = "t2.micro"
  ami_id = "ami-0e53db6fd757e38c7"
  instance_count =  1
}