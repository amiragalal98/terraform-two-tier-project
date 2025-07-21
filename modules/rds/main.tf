resource "aws_db_instance" "db" {
    allocated_storage = 20
    engine = "mysql"
    instance_class = "db.t3.micro"
    username = "admin"
    password = "admin"
    skip_final_snapshot = true
    db_subnet_group_name = aws_db_subnet_group.default.name
    vpc_security_group_ids = []
   
}

resource "aws_db_subnet_group" "default" {
    name       = "main-subnet-group"
    subnet_ids = [var.subnet_id]
}

