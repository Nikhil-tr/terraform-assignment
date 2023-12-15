resource "aws_instance" "dev"{

     tags = {
         Name = "task2-server"
     }
     ami = "ami-0e83be366243f524a"
     instance_type = "t2.micro"
     key_name = "ohio-key"
     security_groups = ["default"]
}

resource "aws_eip" "eip" {
  instance = aws_instance.dev.id
  domain   = "vpc"
}
