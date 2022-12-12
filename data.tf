#data "aws_ami" "maintained" {
#  executable_users = ["self"]
#  most_recent      = true
#  name_regex       = "^amzn2-\\d{3}"
#  owners           = ["amazon"]
#
#  filter {
#    name   = "name"
#    values = ["amzn2-*"]
#  }
#
#  filter {
#    name   = "root-device-type"
#    values = ["ebs"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#}
