provider "aws" {
  region = "us-east-1"
}

provider "null" {
 
}

module "sg_training" {
    source      = "../modules/sg"
    vpc_name    = "training"
}

module "ec2_training" {
    source        = "../modules/ec2"
    instance_type = "t2.micro"

    depends_on = [ module.ebs_training, module.ebs_training ]
}

module "eip_training" {
    source = "../modules/eip"
    instance_id = module.ec2_training.instance_id
}

module "ebs_training" {
    source = "../modules/ebs"
}

module "keypair_training" {
    source       = "../modules/keypair"
    #keyfile_name = "admin-key"
}
