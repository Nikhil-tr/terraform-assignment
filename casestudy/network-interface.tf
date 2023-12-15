resource "aws_network_interface" "ni" {
  tags = {
    Name = "Network-interface"
  }
  subnet_id       = aws_subnet.private.id
  security_groups = [aws_security_group.cs-sg.id]
}

resource "aws_network_interface_attachment" "attach-ni" {
  instance_id          = aws_instance.pri-inst.id
  network_interface_id = aws_network_interface.ni.id
  device_index         = 1
}


