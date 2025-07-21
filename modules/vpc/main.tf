resource "aws_vpc" "main" {
    cider_block = var.cidr_block
}
output "vpc_id" {
    value = aws_vpc.main.id
}