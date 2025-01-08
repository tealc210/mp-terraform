terraform {
    backend "s3" {
        bucket = "dag-tf-training"
        key    = "training.tfstate"
        region = "us-east-1"
    }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
    
    required_version = "~> 1.9"
}

provider "aws" {
  region = "us-east-1"
}


module "sg_training" {
    source      = "../modules/sg"
    vpc_name    = "training"
}

module "ec2_training" {
    source = "../modules/ec2"
}

module "eip_training" {
    source = "../modules/eip"
}

module "ebs_training" {
    source = "../modules/ebs"
}

module "keypair_training" {
    source = "../modules/keypair"
}
