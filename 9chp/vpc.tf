resource "aws_vpc" "my_vpc" {
    cidr_block = "92.75.0.0/16"

    tags = {
        Name = "prac_vpc"
    }
}