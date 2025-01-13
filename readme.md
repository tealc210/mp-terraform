## How to install your instance

Go to the "app" folder and change the values in the host.tfvars file if needed.

**Set your AWS profile :**
\$> export AWS_PROFILE=<NAME_OF_YOUR_AWS_PROFILE>

**Initialize the terraform workdir :**
\$> terraform init

**Deploy with the following command :**
\$> terraform apply --var-file="host.tfvars"
