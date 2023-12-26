variable "name" {
    default = "project-server1"
    type = string
    description = "The name of the aws compute instance"
}


variable "type" {
    default = "t2.micro"
    type = string
    description = "The instance type"
  
}

variable "key-pair" {
    default = "the-key-pair"
    type = string
    description = "key pair name"
  
}
