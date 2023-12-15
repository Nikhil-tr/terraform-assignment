provider "aws"{
    alias = "us-east-2"
    access_key = "AKIAYRBPVQJVOCK4SXI3"
    secret_key = "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"
    region = "us-east-2"
}

resource "aws_instance" "inst2"{
  provider = aws.us-east-2
  tags = {
    Name = "hello-ohio"
  }
  ami = "ami-06d4b7182ac3480fa"
  instance_type = "t2.micro"
  key_name = "ohio-key"
  security_groups = ["default"]
}
