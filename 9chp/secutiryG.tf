resource "aws_security_group" "my_server_securityG" {
    vpc_id = aws_vpc.my_vpc.id
    name        = "my_sever_security_g"
    description = "Allow 22 from web"

    ingress {
        protocol = "tcp"
        from_port = 8080
        to_port = 8080
        cidr_blocks = ["168.83.25.60/32"]
    }

    ingress {
        protocol = "tcp"
        from_port = 8080
        to_port = 8080
        cidr_blocks = ["175.100.203.22/32"]
    }
    
    /*
    ingress {
        protocol = "tcp"
        from_port = 8080
        to_port = 8080
        security_groups = ["sg-09cead68f8296475a"]

    }
    Occur "Cycle error"
    */

    
}

resource "aws_security_group" "my_client_securityG" {
    vpc_id = aws_vpc.my_vpc.id
    name = "my_client_security_g"
    description = "For Server"

    egress {
        protocol = "tcp"
        from_port = 8080
        to_port = 8080
        security_groups = [aws_security_group.my_server_securityG.id]
    }
}

# this rule depends on both security groups so separating it allows it
# to be created after both
# https://github.com/hashicorp/terraform-provider-aws/issues/6015
resource "aws_security_group_rule" "extra_rule" {
  security_group_id        = aws_security_group.my_server_securityG.id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  type                     = "ingress"
  source_security_group_id = aws_security_group.my_client_securityG.id
}
