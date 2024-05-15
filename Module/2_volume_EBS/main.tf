// Module : volume_EBS

variable "volume_size" {}

resource "aws_ebs_volume" "example" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  tags = {
    Name = "ExampleVolume"
  }
}
