##===============Create Webserver 2==============##
resource "aws_instance" "web-server2" {
  ami               = "${var.AWS_AMI}"
  instance_type     = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_web.id]
  subnet_id              = aws_subnet.dev-subnet.id
  monitoring             = false
  key_name          = "terrafrom-key"

  user_data = <<-EOF
  #!/bin/bash
  sudo yum  update -y
  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page294/rent4u.zip
  sudo unzip rent4u.zip
  sudo cp -rvf rent4u-html/* /var/www/html/
  sudo systemctl restart httpd
  EOF

  tags = {
    Name = "web-server"
  }
}
