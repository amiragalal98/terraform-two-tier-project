resource "aws_instance" "web" {
    ami = ""
    instance_type = "t2.micro"
    subnet_id = module.vpc.private_subnets[0]
    tags = {
        Name = "WebServer"
    }
}
resource "aws_lb_target_group_attachement" "attach" {
    target_group_arn = var.alb_target_group_arn
    target_id = aws_instance.web.id
    port = 80
}

