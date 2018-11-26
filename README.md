# Server Application running with AWS ELB

## Local Packages:
- Packer
    - To prepare the base image before any deploy
- AWS Cli and JQ
    - To get the new base image number
- Terraform
    - To execute the deploy of new infraestructure version
    - These are the part of infrastucture on aws cloud:
        - ELB, Target Group, Autoscale Group and Security Group

## The Execution:
    - Add the credentials on properties file:
        AMI_TAG_NAME=MyAppInCloud
        AWS_DEFAULT_REGION=
        AWS_VPC_ID=
        AWS_SUBNET_ID=

    - Call the start script ./start.sh
    - The python script do the replace on packer json template

- TODO - terraform
    security group
    elb

