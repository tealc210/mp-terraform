## How to install your instance

Go to the "app" folder and change the values in the host.tfvars file if needed.

**Set your AWS profile :**
\$> export AWS_PROFILE=<NAME_OF_YOUR_AWS_PROFILE>

**Create your terraform backend on S3 (example through command line) :**
\$> aws s3api create-bucket --bucket <NAME_OF_YOUR_BUCKET>
Replace the Bucket name in the file providers.tf

**Initialize the terraform workdir :**
\$> terraform init

**Deploy with the following command :**
\$> terraform apply --var-file="host.tfvars"
