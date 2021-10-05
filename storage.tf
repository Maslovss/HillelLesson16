
resource "aws_ebs_volume" "example" {
  availability_zone = "${aws_subnet.public_subnet.availability_zone}"
  size              = 20
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.master.id
}
