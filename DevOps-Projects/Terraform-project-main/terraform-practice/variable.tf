variable "aws_dynamodb_table" {
  type = string
  default = "tws-free-bootcamp-table"
  description = "This is tabler name for dynamo db"
}
variable "ami_id" {
  default = "ami-0e53db6fd757e38c7"
  type = string
  description = "This is ami id for EC2"
}