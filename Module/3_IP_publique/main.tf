// Module : IP_publique

resource "aws_eip" "example" {
  vpc      = true
  instance = var.instance_id
}
