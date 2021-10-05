# kube master

resource "aws_instance" "master" {
  depends_on = [
    aws_security_group.sg_k8s
  ]

  ami = "${var.kube_master.ami}"
  instance_type = "${var.kube_master.instance_type}"

  key_name = var.key_name

  vpc_security_group_ids = [aws_security_group.sg_k8s.id]
  subnet_id = aws_subnet.public_subnet.id

  tags = var.tags  


  provisioner "local-exec" {
    command = "echo ${self.public_ip} > master.txt"
  }
   

}