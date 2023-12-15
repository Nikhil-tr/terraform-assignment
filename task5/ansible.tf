resource "null_resource" "ansible"{
 depends_on = [aws_instance.dev]
 provisioner "local-exec"{
  working_dir = "/root/task5"
  command = <<-EOF
               ansible-playbook -i myinv  apache.yaml -u ubuntu --private-key Nvirginia-key.pem
            EOF
 }

}
