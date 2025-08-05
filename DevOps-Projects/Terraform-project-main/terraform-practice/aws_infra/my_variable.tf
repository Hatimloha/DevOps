# my env
variable "my-env" {
  description = "this is the env for infra"
  type = string

}

variable "ami_id" {
    description = "this is the ami_id for infra"
    type = string
  
}


variable "instance_type" {
    description = "this is the instance for infra"
    type = string
}


variable "instance_count" {
    description = "this is the instance_count for infra"
    type = number
}