resource "aws_vpc" "prac_vpc" {
    cidr_block = "92.75.0.0/16"

    tags = {
        Name = "prac_vpc"
    }
}

resource "aws_subnet" "prac_subnet1" {
    vpc_id = aws_vpc.prac_vpc.id
    cidr_block = "92.75.100.0/24"
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "prac_pubSub1"
    }
}

resource "aws_subnet" "prac_subnet2" {
    vpc_id = aws_vpc.prac_vpc.id
    cidr_block = "92.75.200.0/24"
    availability_zone = "ap-northeast-2b"

    tags = {
        Name = "prac_pubSub2"
    }
}

resource "aws_security_group" "prac_security_group_for_LB" {
    vpc_id = aws_vpc.prac_vpc.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "prac_security_group_for_targetG" {
    vpc_id = aws_vpc.prac_vpc.id

    ingress {
        from_port = 30080
        to_port = 30080
        protocol = "tcp"
        security_groups = [aws_security_group.prac_security_group_for_LB.id]
    }

}

resource "aws_security_group_rule" "extra_rule" {
    type = "egress"
    protocol = "tcp"
    security_group_id = aws_security_group.prac_security_group_for_LB.id
    
    from_port = 30080
    to_port = 30080
    
    source_security_group_id = aws_security_group.prac_security_group_for_targetG.id
}