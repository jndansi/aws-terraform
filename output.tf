output "ec2-public-ip" {
    value = aws_instance.web.public_ip
    
}

output "ec2-public-ip1" {
    value = aws_instance.web1.public_ip
    
}

output "id" {
    value = aws_instance.web.id

}
