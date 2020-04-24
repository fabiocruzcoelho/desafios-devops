resource "aws_instance" "instance" {
  ami                       = var.ami
  instance_type             = var.instance_type
  key_name                  = var.key_name
  security_groups           = var.sg_ids
  subnet_id                 = var.subnet_id
  user_data                 = var.user_data

  tags = {
    Name = var.instance_name
  }

lifecycle {
    create_before_destroy = true
  }

}
