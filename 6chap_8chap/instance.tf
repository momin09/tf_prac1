resource "aws_instance" "prac_ec2" {
    ami                    = "ami-081511b9e3af53902"
    instance_type          = "t3.micro"
    subnet_id              = aws_subnet.public_sub1.id
    associate_public_ip_address = true
  /*
  user_data              = <<-EOF
                           #!/bin/bash
                           sudo yum install -y httpd
                           echo "Honglab WebServer" > /var/www/html/index.html
                           sudo systemctl start httpd
                           sudo systemctl enable httpd
                           EOF
  */

    tags = {
        Name = "webserver"
    }
}

resource "aws_network_interface" "additional_eni" {
    subnet_id = aws_subnet.public_sub1.id
    private_ips = ["92.75.100.162"]
    
    attachment {
      instance = aws_instance.prac_ec2.id
      device_index = 1
    }

    tags = {
        Name = "prac_eni"
    }
}
