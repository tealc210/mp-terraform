terraform {
  backend "s3" {
    bucket = "dag-tf-training"
    key    = "training.tfstate"
    region = "us-east-1"
  }

  required_version = "~> 1.9"
}
