resource "aws_eip" "nat_ip" {
    vpc = true

    lifecycle {
        create_before_destroy = true
    }

    tags = {
        name = "prac_eip"
    }
}