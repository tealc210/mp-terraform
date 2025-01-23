## How to install your instance

---

Go to the "app" folder and change the values in the host.tfvars file if needed.

**Set your AWS profile :**
`$> export AWS_PROFILE=<name_of_your_aws_profile>`

**Create your terraform backend on S3 (example through command line) :**
`$> aws s3api create-bucket --bucket <name_of_your_bucket>`
Replace the Bucket name in the file providers.tf

**Initialize the terraform workdir :**
`$> terraform init`

![](assets/20250123_220613_init.png)

**Deploy with the following command :**
`$> terraform plan --var-file="host.tfvars"`

![](assets/20250123_221426_plan.png)
![](assets/20250123_221426_planned.png)

`$> terraform apply --var-file="host.tfvars"`

![](assets/20250123_220644_apply.png)

You will then be able to start to operate Jenkins

![](assets/20250123_220937_jenkins.png)

## Requirements

---

#### What is needed...

This code contained in the "app" folder, is used to deploy an EC2 instance on AWS Cloud, and install Jenkins on it. Therefore, this part is based on 5 modules (using "aws" provider) you can use independently.

**Module "ebs"**
This module creates an AWS Elastic Block Storage volume.
To do so, it requires the 3 following variables :

* ebs_az              => waiting for the availability zone where the EBS will be deployed
* ebs_size            => waiting for the size of the volume in GB
* instance_to_join    => waiting for the instance ID which will receive the volume **(mandatory)**

**Module "ec2"**
This module creates an AWS Elastic Compute Cloud instance.
To do so, it requires the 4 following variables :

* ebs_size        => waiting for the size of the root EBS volume in GB
* host_tags       => waiting for the tags to be applied to the instance
* key_name        => waiting for the name of the SSH key to be used to connect to EC2 **(mandatory)**
* instance_type   => waiting for the AWS instance type

**Module "eip"**
This module creates an AWS Elastic IP.
To do so, it requires only 1 following variable :

* instance_id => waiting for the instance ID which will receive the Elastic IP **(mandatory)**

**Module "keypair"**
This module creates an SSH keypair (and also needs the "null" provider).
To do so, it requires the 3 following variables :

* keyfile_path    => waiting for the path to the folder which will receive the key files
* keyfile_name    => waiting for the name of the key
* key_passphrase  => waiting for the passphrase of the key

**Module "sg"**
This module creates an AWS Security Group (which will give public access to 22, 80, 443 and 8080 ports).
To do so, it requires the 3 following variables :

* vpc_name => waiting for the name of the VPC which will receive the Security Group **(mandatory)**

Please, note that you need name your VPC (using AWS tags).
