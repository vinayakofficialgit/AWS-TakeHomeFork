resource "aws_instance" "nginx" {
  ami           = "ami-0c819f65440d5f1d1" # Ubuntu 20.04 LTS
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.nginx.id]

  user_data = <<-EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl start nginx
EOF

  tags = {
    Name = "nginx-server"
  }
}