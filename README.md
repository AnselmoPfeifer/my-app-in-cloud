# Server Application running with AWS ELB

## Local Packages and Configuration
* SSH private key:
    One private and public key must have on ~/.ssh

* AWS Creadentials:
    One access and a secret key must have on ~/.aws/credentials

* Packer
    To prepare the base image before any deploy

* AWS Cli and JQ
    To get the ami-id

* Terraform
    To execute the deploy of new infrastructure version
    These are the part of infrastructure on AWS cloud created by Terraform:
    ELB, Security Group, Network, Instances...

## The Execution:
* Add the correct properties in my-app.properties file, Check the sample below:
```
AWS_DEFAULT_REGION=us-east-1
AWS_LABEL=app-on-cloud
AWS_VPC_ID=vpc-1c44e464
AWS_SUBNET_ID=subnet-160b8472
```
* Call ./start.sh script, for more information about this script check the description below
    1 - Copy the id_rsa.pub content and create authorized_keys
    2 - Export the aws variable
    3 - The python script do the replace on packer json template
    3 - Packer execution, in this point is created the image base.
    4 - Terraform execution, is the last step, here are created all
        parts of load balance like network instances...


## The Verification:
* The public access from HTTP and SSH:
- After the terraform execution, check the public-access.json,
this file is created by Terraform output command, and we can check the IP,
port to access from Browser (HTTP) or using bash (SSH).

* Validate:
- Check if the instance does not have HTTP access directly, the goal has to timeout (like this example)
```curl -I ec2-52-203-88-97.compute-1.amazonaws.com```
- Test the SSH access example:
```ssh ubuntu@ec2-34-234-223-133.compute-1.amazonaws.com```

* Clean Up
- Use this command to delete all resources created by terraform
```
cd terraform
terraform init
terraform plan
terraform destroy -no-color -force -auto-approve
```
