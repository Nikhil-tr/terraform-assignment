resource "aws_security_group" "my-sg" {
  name        = "my-sg"
  description = "Allow ssh and http"
  vpc_id      = aws_vpc.dev.id

  ingress {
    description      = "allow SSH from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "allow http from anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
   description      = "allow all traffic"
   from_port        = 0
   to_port          = 0
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
  }

}
