resource "aws_internet_gateway" "prac_igw" {
    tags = {
        Name = "prac_igw"
    }

    vpc_id = aws_vpc.prac_vpc.id
}

resource "aws_route_table" "prac_route" {
    tags = {
        Name = "prac_route"
    }

    vpc_id = aws_vpc.prac_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.prac_igw.id
    }
}

resource "aws_route_table_association" "prac_rt_for_sub1" {
    subnet_id = aws_subnet.prac_subnet1.id
    route_table_id = aws_route_table.prac_route.id
}

resource "aws_route_table_association" "prac_rt_for_sub2" {
    subnet_id = aws_subnet.prac_subnet2.id
    route_table_id = aws_route_table.prac_route.id
}
