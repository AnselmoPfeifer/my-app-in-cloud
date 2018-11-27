# Server Application running with AWS ELB

## Local Packages and Configuration
* Add the correct properties in my-app.properties file, Check the sample below:
```
AWS_ACCESS_KEY_ID=<REMOVED>
AWS_SECRET_ACCESS_KEY=<REMOVED>
AWS_SUBNET_ID=<REMOVED>
AWS_DEFAULT_REGION=<REMOVED>
AWS_VPC_ID=<REMOVED>
AWS_LABEL=app-on-cloud
```
* [Packer](https://www.packer.io/docs/install/index.html)
    To prepare the base image before any deploy

* [AWS Cli](https://docs.aws.amazon.com/cli/latest/userguide/installing.html) and [JQ](https://stedolan.github.io/jq/download/)
    To get the ami-id

* [Terraform](https://www.terraform.io/downloads.html)
    To execute the deploy of new infrastructure version
    These are the part of infrastructure on AWS cloud created by Terraform:
    ELB, Security Group, Network, Instances...

## The Execution by bash
* Call ./start.sh script, for more information about this script check the description below
    1 - Copy the id_rsa.pub content and create authorized_keys, to packer folder
    2 - Export the aws variable
    3 - The python script do the replace on packer json template
    3 - Packer execution, in this point is created the image base.
    4 - Terraform execution, is the last step, here are created all parts of load balance like network instances...


## The Verification:
* The public access from HTTP and SSH:
- After the terraform execution is done, check the public-access.json,
this file is created by Terraform output command, and we can check the IP,
port to access from Browser (HTTP) or using bash (SSH).

* Validate:
- Check if the instance does not have HTTP access directly, the goal has to timeout (like this example)
```curl -I ec2-52-203-88-97.compute-1.amazonaws.com```
- Test the SSH access example:
```ssh -i keys/id_rsa ubuntu@ec2-34-234-223-133.compute-1.amazonaws.com```

## Clean Up
- Use this command to delete all resources created by terraform
```
cd terraform
terraform init
terraform plan
terraform destroy -no-color -force -auto-approve
```
