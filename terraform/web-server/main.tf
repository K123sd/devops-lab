provider "aws" {
  region = "ap-south-2"
}

# Create a key pair using your public key
resource "aws_key_pair" "web_key" {
  key_name   = "webserver-key"
  public_key = file("~/.ssh/webserver-key.pub")
}

resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"

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

  tags = {
    Name = "Web Server SG"
  }
}

resource "aws_instance" "web" {
  ami                    = "ami-097685573ca52aa94"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.web_key.key_name
  security_groups        = [aws_security_group.web_sg.name]

  tags = {
    Name = "DevOps-Web-Server"
  }
}

output "web_server_public_ip" {
  value = aws_instance.web.public_ip
}

output "ssh_private_key" {
  value     = file("~/.ssh/webserver-key")
  sensitive = true
}
