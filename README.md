# Server Application running with AWS ELB

## Local Packages and Configuration
- Packer
    To prepare the base image before any deploy

- AWS Cli and JQ
    To get the ami-id

- Terraform
    To execute the deploy of new infrastructure version
    These are the part of infrastructure on AWS cloud created by Terraform:
    ELB, Security Group, Network, Instances...

- SSH private key:
    One private and public key must have on ~/.ssh

- AWS Creadentials:
    One access and a secret key must have on ~/.aws/credential

## The Execution:
- Add the correct properties in my-app.properties file, Check the sample below:
```
AWS_DEFAULT_REGION=us-east-1
AWS_LABEL=app-on-cloud
AWS_VPC_ID=vpc-1c44e464
AWS_SUBNET_ID=subnet-160b8472
```
- Call the start script ./start.sh
    The python script do the replace on packer json template

- The public access from HTTP and SSH:
    After the terraform execution,
    check the public-access.json, this file is created by Terraform output command, and we can check the IP,
    port to access from Browser (HTTP) or using bash (SSH).

- Validate:
    Check if the instance does not have HTTP access directly, the goal has to timeout (like this example)
    ```curl -I ec2-52-203-88-97.compute-1.amazonaws.com```
    Test the SSH access, PS: the private

- Clean Up
    Use this command to delete all resources created by terraform
```
cd terraform
terraform destroy -no-color -force -auto-approve
```
