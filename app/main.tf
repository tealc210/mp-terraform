provider "aws" {
  region = "us-east-1"
}

module "training_project_sg" {
    source      = "../modules/sg"
    vpc_name    = "training"
}

module "training_project_ec2" {
    source        = "../modules/ec2"
    instance_type = "t2.micro"
    key_name      = "ec2-defaultkey"

    depends_on = [ module.training_project_keypair, module.training_project_ebs ]
}

module "training_project_eip" {
    source      = "../modules/eip"
    instance_id = module.training_project_ec2.instance_id
}

module "training_project_ebs" {
    source = "../modules/ebs"
}

module "training_project_keypair" {
    source       = "../modules/keypair"
    #keyfile_name = "admin-key"
}
