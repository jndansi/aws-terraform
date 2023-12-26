variable "server1" {
    default = "project-web-server1"
    type = string
    description = "The name of the aws compute instance"
}

variable "server2" {
    default = "project-web-server2"
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

variable "ami" {
    default = "ami-0574da719dca65348"
    type = string
    description = "Machine image to be used"
  
}
