resource "aws_route_table" "my_route_table" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }

    tags = {
        Name = "prac_tf_rt"
    }
}

resource "aws_route_table_association" "my_association_with_pub1" {
    subnet_id = aws_subnet.public_sub1.id
    route_table_id = aws_route_table.my_route_table.id
}

resource "aws_route_table_association" "my_association_with_pub2" {
    subnet_id = aws_subnet.public_sub2.id
    route_table_id = aws_route_table.my_route_table.id
}