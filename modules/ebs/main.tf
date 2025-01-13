resource "aws_ebs_volume" "ebs_supp" {
  availability_zone = var.ebs_az
  size = var.ebs_size
}

resource "aws_volume_attachment" "attach_instance" {
  instance_id = var.instance_to_join
  volume_id = aws_ebs_volume.ebs_supp.id
  device_name = "/dev/sdx"
}