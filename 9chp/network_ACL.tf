resource "aws_network_acl" "my_nacl" {
    tags = {
        name    = "my_prac_nacl"
    }
    vpc_id = aws_vpc.my_vpc.id

    ingress {
        protocol = "tcp"
        rule_no = 100
        action = "allow"
        from_port = 80
        to_port = 80
        cidr_block = "160.83.25.60/32"
    }

    egress {
        protocol = "tcp"
        rule_no = 100
        action = "allow"
        // tcp 전체 포트를 하고 싶으면 0-65535
        from_port = 0
        to_port = 65535
        cidr_block = "160.83.25.60/32"
    }

    subnet_ids = [aws_subnet.public_sub1.id, aws_subnet.public_sub2.id]
}
