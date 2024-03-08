provider "aws" {
  region = "us-east-1"
}


// Create security group
resource "aws_security_group" "e-jotter-terraform-sg" {

  # To allow all inbound SSH Traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}


resource "aws_instance" "e-jotter-terraform-instance" {
  instance_type = "t2.micro"
  ami           = "ami-0005e0cfe09cc9050"
  tags = {
    Name = "fnote-mfa-cicd-terraform-instance-01"
  }

  # use the security group created above
  vpc_security_group_ids = [aws_security_group.e-jotter-terraform-sg.id]
}