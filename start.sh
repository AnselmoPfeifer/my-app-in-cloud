#!/usr/bin/env bash

echo 'Getting public ssh key'
cat ~/.ssh/id_rsa.pub > packer/authorized_keys

function exportVariables() {
    echo 'INFO:export aws credential variables'
    for var in $(cat my-app.properties); do
        export $var
    done
}

function packerExecution() {
    packer validate 'packer/template.json'
    packer build -force -color=false 'packer/template.json'
}

function terraformExecution() {
    cd terraform
    terraform init -force-copy
    terraform plan
    terraform apply -auto-approve
    terraform output -no-color -json > ../public-access.json
}

exportVariables
python replace_packer.py
packerExecution

export AWS_AMI_ID=$(aws ec2 describe-images --region ${AWS_DEFAULT_REGION}  --filters "Name=tag-key,Values=Name,Name=tag-value,Values=${AWS_LABEL}" --query 'Images[*].{id:ImageId}' | jq .[].id)

cat terraform/variables.tf.tpl \
    | sed "s/AWS_DEFAULT_REGION/${AWS_DEFAULT_REGION}/g" \
    | sed "s/AWS_AMI_ID/${AWS_AMI_ID}/g" \
    | sed "s/AWS_LABEL/${AWS_LABEL}/g"  > terraform/variables.tf

echo "The new AWS AMI is: ${AWS_AMI_ID}"
terraformExecution