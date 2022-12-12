output "instanceidwebserver1" {
  value = aws_instance.main_web_server1.id

}

output "instanceidwebserver2" {
  value = aws_instance.main_web_server2.id

}

output "publicipwebserver1" {
  value = aws_instance.main_web_server1.public_ip
}

output "publicipwebserver2" {
  value = aws_instance.main_web_server2.public_ip
}

output "privateipwebserver1" {
  value = aws_instance.main_web_server1.private_ip
}

output "privateipwebserver2" {
  value = aws_instance.main_web_server2.private_ip
}

# print the url of the server
output "main_web_server2_ipv4_url" {
  value = join("", ["http://", aws_instance.main_web_server2.public_ip])
}

# print the url of the server
output "main_web_server1_ipv4_url" {
  value = join("", ["http://", aws_instance.main_web_server1.public_ip])
}
