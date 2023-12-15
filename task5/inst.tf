resource "aws_instance" "dev"{
  tags = {
    Name = "my-server"
  }
  ami = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name = "Nvirginia-key"
  security_groups = ["default","Only-SSH"]
  # this creates a file myinv and stores the public-ip of inst in it 
  provisioner "local-exec"{                            
    command = "sleep 10 ; echo ${self.public_ip} > ./myinv"
  }
}
