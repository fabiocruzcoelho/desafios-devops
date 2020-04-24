provider "aws" {
  profile    = "default"
  region     = var.region
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
  }
}

data "template_file" "user-data" {
  template = "${file("../terraform/user-data.sh")}"
}

module "vpc" {
  source = "../terraform/modules/vpc"

  vpc_name    = var.vpc_name
  cidr_block  = var.cidr_block
  subnet_cidr = var.subnet_cidr
  subnet_name = var.subnet_name
  igw_name    = var.igw_name
  rt_name     = var.rt_name
  cidr_igw    = var.cidr_igw
}

module "key_pair" {
  source = "../terraform/modules/key_pair"

  key_name    = var.key_name
  aws_ssh_key = var.key_name
}

module "security_groups" {
  source = "../terraform/modules/security_groups"

  cidr_sg  = var.cidr_sg
  cidr_ssh = var.cidr_ssh
  vpc_id   = module.vpc.vpc_id
}

module "ec2" {
  source        = "../terraform/modules/instance"
  ami           = "${data.aws_ami.amazon_linux.id}"
  instance_type = var.instance_type
  key_name      = "${module.key_pair.key_name}"
  sg_ids        = ["${module.security_groups.http_https}", "${module.security_groups.ssh}"]
  subnet_id     = "${module.vpc.subnet_id}"
  instance_name = var.instance_name
  user_data     = "${data.template_file.user-data.rendered}"
}