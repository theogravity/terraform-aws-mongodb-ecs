data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "mongo-ecs-instance" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.subnet_id
  iam_instance_profile        = aws_iam_instance_profile.default.id
  user_data                   = data.template_file.user-data.rendered
  key_name                    = var.instance_ssh_key_pair_name == "" ? null : var.instance_ssh_key_pair_name
  associate_public_ip_address = var.instance_enable_public_ip
  tags = var.tags

  root_block_device {
    volume_size = var.instance_volume_size
    volume_type = var.instance_volume_type
  }
}

data "template_file" "user-data" {
  template = file("${path.module}/templates/user-data.sh")

  vars = {
    cluster_name = var.name
    region       = var.region
  }
}
