resource "aws_instance" "web" {
  ami                         = "ami-0574da719dca65348"
  instance_type               = var.type
  key_name                    = var.key-pair
  vpc_security_group_ids      = [aws_security_group.vpc_sg.id]
  subnet_id                   = aws_subnet.main.id
  associate_public_ip_address = true
 


  tags = {
    Name        = var.name
    Environment = "production"
  }

  user_data = file("script.sh")

}

resource "aws_instance" "web1" {
  ami                         = "ami-0574da719dca65348"
  instance_type               = var.type
  key_name                    = var.key-pair
  vpc_security_group_ids      = [aws_security_group.vpc_sg.id]
  subnet_id                   = aws_subnet.main.id
  associate_public_ip_address = true
 


  tags = {
    Name        = "project-server2"
    Environment = "production"
  }

  user_data = file("script.sh")

}

resource "aws_instance" "db" {
  ami                         = "ami-0574da719dca65348"
  instance_type               = var.type
  key_name                    = var.key-pair
  vpc_security_group_ids      = [aws_security_group.vpc_sg2.id]
  subnet_id                   = aws_subnet.main2.id
  associate_public_ip_address = false
 


  tags = {
    Name = "project-db1"
  }
}

resource "aws_instance" "db2" {
  ami                         = "ami-0574da719dca65348"
  instance_type               = var.type
  key_name                    = var.key-pair
  vpc_security_group_ids      = [aws_security_group.vpc_sg2.id]
  subnet_id                   = aws_subnet.main2.id
  associate_public_ip_address = false
 


  tags = {
    Name = "project-db2"
  }
}

# module "ec2_instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "~> 3.0"

#   name = "single-instance"

#   ami                    = "ami-ebd02392"
#   instance_type          = "t2.micro"
#   key_name               = "user1"
#   monitoring             = true
#   vpc_security_group_ids = ["sg-12345678"]
#   subnet_id              = "subnet-eddcdzz4"

#   tags = {
#     Terraform   
#     Environment = "dev"
#   }
# }

