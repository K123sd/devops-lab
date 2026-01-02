 provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "rhel10" {
  ami           = "ami-097685573ca52aa94"
  instance_type = "t3.micro"

  tags = {
    Name = "DevOps-Lab-RHEL10"
  }
}

output "instance_public_ip" {
  value = aws_instance.rhel10.public_ip
}

