# https://registry.terraform.io/providers/C2Devel/croccloud/latest/docs/resources/placement_group
resource "aws_placement_group" "pg" {
  name     = "sandbox-attach-demo"
  strategy = "spread"
}

# https://registry.terraform.io/providers/C2Devel/croccloud/latest/docs/resources/instance
resource "aws_instance" "instance" {
  key_name        = "atsarev"
  ami             = "cmi-54FC64C1"
  instance_type   = "c5.4large"
  subnet_id       = "subnet-12345678"
  placement_group = aws_placement_group.pg.id

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    iops                  = 0
    delete_on_termination = true

    tags = {
      Name = "sandbox-attach-demo"
    }
  }

  tags = {
    Name = "sandbox-attach-demo"
  }
}

# https://registry.terraform.io/providers/C2Devel/croccloud/latest/docs/resources/ebs_volume
resource "aws_ebs_volume" "ebs_disk2" {
  availability_zone = "ru-msk-vol51"
  type              = "gp2"
  size              = 8

  tags = {
    Name = "sandbox-attach-demo_disk2"
  }
}

# https://registry.terraform.io/providers/C2Devel/croccloud/latest/docs/resources/volume_attachment
resource "aws_volume_attachment" "ebs_attach_disk2" {
  device_name = "disk2"
  volume_id   = aws_ebs_volume.ebs_disk2.id
  instance_id = aws_instance.instance.id
}

# https://registry.terraform.io/providers/C2Devel/croccloud/latest/docs/resources/ebs_volume
resource "aws_ebs_volume" "ebs_disk3" {
  availability_zone = "ru-msk-vol51"
  type              = "gp2"
  size              = 8

  tags = {
    Name = "sandbox-attach-demo_disk3"
  }
}

# https://registry.terraform.io/providers/C2Devel/croccloud/latest/docs/resources/volume_attachment
resource "aws_volume_attachment" "ebs_attach_disk3" {
  device_name = "disk2"
  volume_id   = aws_ebs_volume.ebs_disk3.id
  instance_id = aws_instance.instance.id
}

# https://registry.terraform.io/providers/C2Devel/croccloud/latest/docs/resources/ebs_volume
resource "aws_ebs_volume" "ebs_disk4" {
  availability_zone = "ru-msk-vol51"
  type              = "gp2"
  size              = 8

  tags = {
    Name = "sandbox-attach-demo_disk4"
  }
}

# https://registry.terraform.io/providers/C2Devel/croccloud/latest/docs/resources/volume_attachment
resource "aws_volume_attachment" "ebs_attach_disk4" {
  device_name = "disk2"
  volume_id   = aws_ebs_volume.ebs_disk4.id
  instance_id = aws_instance.instance.id
}

# https://registry.terraform.io/providers/C2Devel/croccloud/latest/docs/resources/ebs_volume
resource "aws_ebs_volume" "ebs_disk5" {
  availability_zone = "ru-msk-vol51"
  type              = "gp2"
  size              = 8

  tags = {
    Name = "sandbox-attach-demo_disk5"
  }
}

# https://registry.terraform.io/providers/C2Devel/croccloud/latest/docs/resources/volume_attachment
resource "aws_volume_attachment" "ebs_attach_disk5" {
  device_name = "disk5"
  volume_id   = aws_ebs_volume.ebs_disk5.id
  instance_id = aws_instance.instance.id
}
