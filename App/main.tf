// main.tf

module "ec2_instance" {
  source            = "./modules/ec2_instance"
  instance_type     = var.instance_type
  instance_size     = var.instance_size
  volume_size       = var.volume_size
  security_group_id = module.security_group.id
  subnet_id         = var.subnet_id
}

module "ebs_volume" {
  source      = "./modules/ebs_volume"
  volume_size = var.volume_size
}

module "public_ip" {
  source       = "./modules/public_ip"
  instance_id  = module.ec2_instance.instance_id
}

module "security_group" {
  source = "./modules/security_group"
}
