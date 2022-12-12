variable "mainvpc-cidr" {
  default = "11.0.0.0/16"
  type = string
}

variable "main_publicSubnet1-cidr" {
  default = "11.0.0.0/24"
  type = string
}

variable "main_publicSubnet2-cidr" {
  default = "11.0.1.0/24"
  type = string
}

variable "main_privateSubnet1-cidr" {
  default = "11.0.3.0/24"
  type = string
}

variable "main_privateSubnet2-cidr" {
  default = "11.0.4.0/24"
  type = string
}

variable "ssh-location" {
  default = "0.0.0.0/0"
  type    = string
}
