resource "aws_instance" "private-servers" {
  count                       = var.environment == "Production" ? 2 : 1
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  iam_instance_profile = var.iam_instance_profile
  subnet_id                   = element(var.private_subnets, count.index)
  vpc_security_group_ids      = var.sg_id
  associate_public_ip_address = false
  tags = {
    Name        = "${var.vpc_name}-Private-Server-${count.index + 1}"
    environment = "${var.environment}"
  }
  #     user_data = <<-EOF
  # # 	#!/bin/bash
  # #       sudo apt install nginx -y        
  # #       sudo systemctl start nginx
  # #       sudo systemctl enable nginx
  # # EOF
  depends_on = [var.elb_listener]
}