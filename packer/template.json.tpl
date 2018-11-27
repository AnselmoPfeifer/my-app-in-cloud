{
  "variables": {
    "destination_regions": "<AWS_DEFAULT_REGION>",
    "aws_vpc_id": "<AWS_VPC_ID>",
    "aws_subnet_id": "<AWS_SUBNET_ID>",
    "ami_name": "<AWS_LABEL>",
    "aws_ssh_username": "ubuntu",
    "source_ami": "ami-80861296"
  },

  "builders": [
    {
      "type": "amazon-ebs",
      "access_key": "{{user `aws_access_key`}}",
      "secret_key": "{{user `aws_secret_key`}}",
      "region": "{{user `destination_regions`}}",
      "ami_regions": "{{user `destination_regions`}}",
      "source_ami": "{{user `source_ami`}}",
      "instance_type": "t2.nano",
      "vpc_id": "{{user `aws_vpc_id`}}",
      "subnet_id": "{{user `aws_subnet_id`}}",
      "ssh_username": "{{user `aws_ssh_username`}}",
      "ami_name": "{{user `ami_name`}}",
      "tags": {
        "Name": "{{user `ami_name`}}",
        "OS_Version": "ubuntu"
      }
    }
  ],

  "provisioners": [
    {
      "type": "file",
      "source": "app/index.html",
      "destination": "/tmp/index.html"
    },
   {
      "type": "file",
      "source": "packer/configure",
      "destination": "/tmp/configure"
   },
   {
      "type": "file",
      "source": "packer/authorized_keys",
      "destination": "/tmp/authorized_keys"
   },
    {
        "type": "file",
        "source": "packer/default",
        "destination": "/tmp/default"
    },
    {
      "type": "shell",
      "inline": [
        "cd /tmp/ && ./configure"
      ]
    }
  ]
}
