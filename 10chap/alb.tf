resource "aws_lb" "prac_alb" {
    tags = {
        Name = "prac_alb"
    }
    internal = false
    security_groups = [aws_security_group.prac_security_group_for_LB.id]
    subnets = [aws_subnet.prac_subnet1.id, aws_subnet.prac_subnet2.id]
    load_balancer_type = "application"

}

resource "aws_lb_target_group" "prac_target_group" {
    tags = {
        Name = "prac_target_group"
    }
    vpc_id = aws_vpc.prac_vpc.id
    port = 80
    protocol = "HTTP"
    
}

resource "aws_lb_target_group_attachment" "prac_inst1" {
    target_group_arn = aws_lb_target_group.prac_target_group.arn
    target_id = aws_instance.prac_ec2_1.id
    port = 80
}

resource "aws_lb_target_group_attachment" "prac_inst2" {
    target_group_arn = aws_lb_target_group.prac_target_group.arn
    target_id = aws_instance.prac_ec2_2.id
    port = 80
}

resource "aws_lb_listener" "prac_listner" {
    tags = {
        Name = "prac_listner"
    }

    load_balancer_arn = aws_lb.prac_alb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.prac_target_group.arn
    }
}
/*
 ALB 구성
 1. resource ALB
 2. resource ALB target Group
 3. resource ALB target Gorup attachment
    - target_group_arn
    - target_id
 4. resource ALB Listener
    - default_action
    - load_balancer_arn
*/