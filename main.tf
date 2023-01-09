resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "project-vpc"
  }
}

resource "aws_security_group" "vpc_sg" {
  name        = "project_vpc_sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "All"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "All"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  

  tags = {
    Name = "project_vpc_sg"
  }
}

resource "aws_security_group" "vpc_sg2" {
  name        = "project_private_sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "All"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project_private_sg"
  }
}


resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/25"
  availability_zone = "us-east-1d"

  tags = {
    Name = "project-subnet1"
  }
}

resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.128/25"
  availability_zone = "us-east-1b"

  tags = {
    Name = "project-subnet2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "project-igw"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  # route {
  #   # cidr_block = "10.0.0.0/24"
  #   # # gateway_id = "local"
  # }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

#   route {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#   }

  tags = {
    Name = "project-rt-public"
  }
}

resource "aws_route_table" "main2" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "project-rt-private"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main2.id
  route_table_id = aws_route_table.main2.id
}







