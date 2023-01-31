resource "aws_instance" "prac_ec2_1" {
    ami                    = "ami-081511b9e3af53902"
    instance_type          = "t3.micro"
    subnet_id              = aws_subnet.prac_subnet1.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.prac_security_group_for_targetG.id]
    tags = {
        Name = "prac_alb_ec2_1"
    }
}

resource "aws_instance" "prac_ec2_2" {
    ami                    = "ami-081511b9e3af53902"
    instance_type          = "t3.micro"
    subnet_id              = aws_subnet.prac_subnet2.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.prac_security_group_for_targetG.id]
    tags = {
        Name = "prac_alb_ec2_2"
    }
}