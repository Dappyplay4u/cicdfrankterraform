resource "aws_instance" "main_web_server1" {
  ami = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main_publicsubnet1.id
  key_name = "newlycreated1"
  vpc_security_group_ids = [aws_security_group.main_webserver-security-group.id]
  user_data              = file("installtechmax.sh")
  tags = {
    Name = "webserver for techmax"
  }
}

resource "aws_network_interface" "main_network_interface" {
  subnet_id   = aws_subnet.main_publicsubnet1.id

  tags = {
    Name = "main_network_interface"
  }
}


resource "aws_instance" "main_web_server2" {
  ami = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main_publicsubnet2.id
  key_name = "newlycreated1"
  vpc_security_group_ids = [aws_security_group.main_webserver-security-group.id]
  user_data              = file("installtechmax.sh")
  tags = {
    Name = "webserver for techmax"
  }
}

resource "aws_network_interface" "main_network_interface2" {
  subnet_id   = aws_subnet.main_publicsubnet2.id

  tags = {
    Name = "main_network_interface"
  }
}


###APP SERVERS PRIVATE SUBNETS

resource "aws_instance" "main_app_server1" {
  ami = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main_privatesubnet1.id
  key_name = "newlycreated1"
  vpc_security_group_ids = [aws_security_group.ssh-security-group.id]
  tags = {
    Name = "appserver for techmax"
  }
}

resource "aws_network_interface" "main_network_interface3" {
  subnet_id   = aws_subnet.main_privatesubnet1.id

  tags = {
    Name = "main_network_interface"
  }
}


resource "aws_instance" "main_app_server2" {
  ami = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main_privatesubnet2.id
  key_name = "newlycreated1"
  vpc_security_group_ids = [aws_security_group.ssh-security-group.id]
  tags = {
    Name = "appserver for techmax"
  }
}

resource "aws_network_interface" "main_network_interface4" {
  subnet_id   = aws_subnet.main_privatesubnet2.id

  tags = {
    Name = "main_network_interface"
  }
}
