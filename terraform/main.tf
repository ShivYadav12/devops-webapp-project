provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH"
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
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer_key.key_name
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "Terraform-Ansible-Docker-App"
  }
}