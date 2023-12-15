resource "aws_instance" "ec2" {
 ami           = "ami-0e83be366243f524a"
 instance_type = "t2.micro"
 key_name = "ohio-key"
 tags = {
   Name = "first-ec2-server"
 }
 security_groups = ["default"]
}

resource "aws_instance" "ec22" {
 ami           = "ami-0e83be366243f524a"
 instance_type = "t2.micro"
 key_name = "tf-key"
 tags = {
   Name = "second-ec2-server"
 }
 security_groups = ["default"]
}


