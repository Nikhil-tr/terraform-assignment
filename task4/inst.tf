resource "aws_instance" "pub-inst"{
 tags = {
   Name = "public-inst"
 }
 ami = "ami-0e83be366243f524a"
 instance_type = "t2.micro"
 key_name = "ohio-key"
 subnet_id = aws_subnet.public.id
 associate_public_ip_address = true
 security_groups = [aws_security_group.my-sg.id]
}

