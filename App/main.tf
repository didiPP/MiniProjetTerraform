// main.tf

#

module "ec2_instance" {
  source            = "./Module/1_instance_ec2"
  instance_type     = var.instance_type
  instance_size     = var.instance_size
  volume_size       = var.volume_size
  security_group_id = module.security_group.id
  subnet_id         = var.subnet_id
}

module "ebs_volume" {
  source      = "../Module/2_Module_volume_EBS"
  volume_size = var.volume_size
}

module "public_ip" {
  source       = "../Module/3_IP_publique"
  instance_id  = module.ec2_instance.instance_id
}

module "security_group" {
  source = "../Module/4_Module_security"
}
