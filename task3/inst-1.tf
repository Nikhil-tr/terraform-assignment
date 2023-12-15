provider "aws"{
    alias = "us-east-1"
    access_key = "AKIAYRBPVQJVOCK4SXI3"
    secret_key = "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"
    region = "us-east-1"
}

resource "aws_instance" "inst1"{
  provider = aws.us-east-1

  tags = {
    Name = "hello-virginia"
  }
  ami = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name = "Nvirginia-key"
  security_groups = ["default","Only-SSH"]
}
