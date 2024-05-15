// Module : instance_ec2

variable "instance_type" {}
variable "instance_size" {}
variable "volume_size" {}
variable "security_group_id" {}
variable "subnet_id" {}

resource "aws_instance" "example" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = var.subnet_id
  security_groups        = [var.security_group_id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp2"
  }

  tags = {
    Name = "ExampleInstance"
  }
}
