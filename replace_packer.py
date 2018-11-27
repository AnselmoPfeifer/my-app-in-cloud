import os
import json
import logging

logging.basicConfig(level=logging.DEBUG)
logging.basicConfig(level=logging.INFO)
LOG = logging.getLogger('aws-elb')

TEMPLATE = 'packer/template.json.tpl'
AWS_VPC_ID =  os.environ['AWS_VPC_ID']
AWS_LABEL =  os.environ['AWS_LABEL']
AWS_SUBNET_ID =  os.environ['AWS_SUBNET_ID']
AWS_DEFAULT_REGION = os.environ['AWS_DEFAULT_REGION']

def read_json_file(filename):
    try:
        LOG.debug("Loading json file: %s", filename)
        with open(filename) as file:
            data = file.read()
            return json.loads(data)
    except:
        LOG.error("Cannot read json file %s.", filename)


def replace_data():
    LOG.info('Starting replace envs')
    json_data = read_json_file(TEMPLATE)
    json_data['variables']['destination_regions'] = AWS_DEFAULT_REGION
    json_data['variables']['aws_vpc_id'] = AWS_VPC_ID
    json_data['variables']['aws_subnet_id'] = AWS_SUBNET_ID
    json_data['variables']['ami_name'] = AWS_LABEL

    with open('packer/template.json', 'w') as file:
        json.dump(json_data, file, indent=2)


if __name__ == '__main__':
    replace_data()

