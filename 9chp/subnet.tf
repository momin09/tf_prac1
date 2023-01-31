resource "aws_subnet" "public_sub1" {
    cidr_block = "92.75.100.0/24"
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "prac_pub_subnet1"
    }
}

resource "aws_subnet" "public_sub2" {
    cidr_block = "92.75.200.0/24"
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "prac_pub_subnet2"
    }
}

resource "aws_subnet" "private_sub1" {
    cidr_block = "92.75.10.0/24"
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "prac_priv_subnet1"
    }
}

resource "aws_subnet" "private_sub2" {
    cidr_block = "92.75.20.0/24"
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "prac_priv_subnet2"
    }
}

resource "aws_subnet" "private_sub3" {
    cidr_block = "92.75.30.0/24"
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "prac_priv_subnet3"
    }
}

resource "aws_subnet" "private_sub4" {
    cidr_block = "92.75.40.0/24"
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "prac_priv_subnet4"
    }
}