
resource "aws_ebs_volume" "volumes" {

  for_each  =  var.kube_workers 

  availability_zone = lookup( aws_subnet.subnets , each.value.subnet ).availability_zone
  size              = each.value.ebs_drive_size
}

resource "aws_volume_attachment" "ebs_att" {

  for_each  =  var.kube_workers 

  device_name = "/dev/xvdb"
  volume_id   = lookup(aws_ebs_volume.volumes , each.key).id
  instance_id = lookup(aws_instance.workers, each.key).id
}
