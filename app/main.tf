provider "aws" {
  region = "us-east-1"
}

module "training_project_sg" {
  source   = "../modules/sg"
  vpc_name = var.vpc_name
}

module "training_project_ec2" {
  source        = "../modules/ec2"
  instance_type = var.instance_type
  key_name      = var.key_name
  srv_key       = module.training_project_keypair.srv_prv_key

  depends_on = [module.training_project_keypair]
}

module "training_project_eip" {
  source      = "../modules/eip"
  instance_id = module.training_project_ec2.instance_id
}

module "training_project_ebs" {
  source           = "../modules/ebs"
  instance_to_join = module.training_project_ec2.instance_id
  ebs_az           = module.training_project_ec2.instance_az
  ebs_size         = 6
}

module "training_project_keypair" {
  source       = "../modules/keypair"
  keyfile_name = var.key_name
}
