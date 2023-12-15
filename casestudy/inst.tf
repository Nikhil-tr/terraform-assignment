resource "aws_instance" "pub-inst"{
 tags = {
   Name = "public-inst"
 }
 ami = "ami-0fc5d935ebf8bc3bc"
 instance_type = "t2.micro"
 key_name = "cs-key"
 subnet_id = aws_subnet.public.id
 associate_public_ip_address = true
 security_groups = [aws_security_group.cs-sg.id]
 user_data = <<-EOF
               #!/bin/bash
               sudo apt update -y
               sudo apt install apache2 -y
             EOF
}

resource "aws_instance" "pri-inst"{
 tags = {
   Name = "private-inst"
 }
 ami = "ami-0fc5d935ebf8bc3bc"
 instance_type = "t2.micro"
 key_name = "cs-key"
 subnet_id = aws_subnet.private.id
 associate_public_ip_address = false
 security_groups = [aws_security_group.cs-sg.id]
}

