output "ec2_public_ip" {
    value =module.ec2_instance.public_ip
}
output "rds_endpoint"{
    value module.rds.endpoint
}