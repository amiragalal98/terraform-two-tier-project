resource "aws_lb" "app_lb" {
    name = "app-lb"
    internal = false
    load_balancer_type = "application"
    subnets = var.subnet_ids
    
}
resource "aws_lb_target_group" "tg" {
    name = "app-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
}