variable "region" {
  description = "Qual regiao deseja utilizar?"
}

variable "cidr_ssh" {
  description = "Qual range de IP deseja liberar para acesso SSH?"
}

variable "instance_name" {
  default = "desafio_idwall"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "desafio_idwall"
}

variable "cidr_sg" {
  default = "0.0.0.0/0"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  default = "desafio_idwall_vpc"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet_name" {
  default = "pub-subnet"
}

variable "igw_name" {
  default = "desafio_idwall_igw"
}

variable "rt_name" {
  default = "desafio_idwall_rt"
}

variable "cidr_igw" {
  default = "0.0.0.0/0"
}