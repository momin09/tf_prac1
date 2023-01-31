resource "aws_network_interface" "securityG_eni" {
    tags ={
        name = "server_eni"
    }
    subnet_id = aws_subnet.private_sub1.id
    private_ips = ["92.75.10.162"]

    # security_groups = [aws_security_group.my_client_securityG.id, aws_security_group.my_server_securityG.id]

    description = "This is for practicing attaching eni with SG"

}
