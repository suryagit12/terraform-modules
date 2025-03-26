resource "aws_instance" "public-servers" {
  count                       = var.environment == "Production" ? 2 : 1
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = var.instance_type
  key_name                    = var.key_name
  iam_instance_profile = var.iam_instance_profile
  subnet_id                   = element(var.public_subnets, count.index)
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  tags = {
    Name        = "${var.vpc_name}-Public-Server-${count.index + 1}"
    environment = "${var.environment}"
  }
    user_data = <<-EOF
      #!/bin/bash
      sudo apt update -y
      sudo apt install nginx -y
      sudo systemctl start nginx
      sudo systemctl enable nginx 1 
      echo "<h1>Hello from Terraform!</h1>" | sudo tee /var/www/html/index.html
  EOF
  depends_on = [var.elb_listener_public]
}