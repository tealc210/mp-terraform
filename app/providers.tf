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
        # null = {
        #     source = "hashicorp/null"
        #     version = "3.2.3"
        # }
    }
    
    required_version = "~> 1.9"
}
