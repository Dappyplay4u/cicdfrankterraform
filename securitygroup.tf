# Create Security Group for the Application Load Balancer
# terraform aws create security group
resource "aws_security_group" "main_alb-security-group" {
  name        = "ALB Security Group"
  description = "Enable HTTP/HTTPS access on Port 80/443"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description      = "HTTP Access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS Access"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "ALB Security Group"
  }
}

# Create Security Group for the Bastion Host aka Jump Box
# terraform aws create security group
resource "aws_security_group" "ssh-security-group" {
  name        = "SSH Security Group"
  description = "Enable SSH access on Port 22"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.ssh-location}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "SSH Security Group"
  }
}

# Create Security Group for the Web Server
# terraform aws create security group
# create security group for the ec2 instance
resource "aws_security_group" "main_webserver-security-group" {
  name        = "ec2 security group"
  description = "allow access on ports 80 and 22"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2 security group"
  }
}
