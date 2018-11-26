#!/usr/bin/env bash

echo 'Getting public ssh key'
cat ~/.ssh/id_rsa.pub > packer/authorized_keys

function exportVariables() {
    echo 'INFO:export aws credential variables'
    for var in $(cat aws-credentials.properties); do
        export $var
    done
}

exportVariables
python replace_packer.py

packer validate 'packer/template.json'
packer build -force -color=false 'packer/template.json'

AWS_AMI_ID=$(aws ec2 describe-images --region ${AWS_DEFAULT_REGION}  --filters "Name=tag-key,Values=Name,Name=tag-value,Values=${AMI_TAG_NAME}" --query 'Images[*].{id:ImageId}' | jq .[].id)
PUBLIC_KEY=$(cat ~/.ssh/id_rsa.pub)

#python replace_terraform.py

#cat terraform/provider.tf.tpl \
#    | sed "s/<AWS_DEFAULT_REGION>/${AWS_DEFAULT_REGION}/g" \
#    | sed "s/<PUBLIC_KEY>/${PUBLIC_KEY}/g" \
#    | sed "s/<AWS_AMI_ID>/${AWS_AMI_ID}/g"  > terraform/provider.tf
