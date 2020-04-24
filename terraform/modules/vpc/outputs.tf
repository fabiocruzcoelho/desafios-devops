 
output "vpc_id" {
  value = "${aws_vpc.desafio_idwall.id}"
}

output "subnet_id" {
  value = "${aws_subnet.desafio_idwall_pub_subnet.id}"
}
