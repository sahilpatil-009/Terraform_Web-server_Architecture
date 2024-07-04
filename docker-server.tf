##=================Create Docker Server================##
resource "aws_instance" "Docker-server3" {
  ami               = "${var.AWS_AMI}"
  instance_type     = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_web.id]
  subnet_id              = aws_subnet.dev-subnet.id
  monitoring             = false
  key_name          = "terrafrom-key"

  user_data = <<-EOF
  #!/bin/bash
  sudo yum  update -y
  sudo yum install docker -y
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo docker run -dt -t -p 8080:80 httpd
  sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page295/finter.zip
  sudo unzip finter.zip
  sudo mkdir /web
  sudo chmod 777 /web
  sudo cp -rvf /finter-html/* /web/
  sudo docker run -dt -t -p 8090:80 -v /web/:/usr/local/apache2/htdocs/ --privileged=true httpd
  EOF

  tags = {
    Name = "docker-server"
  }
}
