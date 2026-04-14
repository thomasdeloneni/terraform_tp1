# --- AMI Ubuntu 22.04 LTS ---

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# --- Instance EC2 web ---

resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = local.instance_type
  subnet_id                   = aws_subnet.this["public"].id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true
  key_name                    = var.key_name
  user_data                   = file("user-data.sh")

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "${local.prefix}-ec2-web"
  }
}
