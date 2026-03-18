### Create a NACL
aws ec2 create-network-acl \
--vpc-id vpc-0f8ebc633527a4ac5 \
--region us-east-1 \
--tag-specifications "ResourceType=network-acl,Tags=[{Key=Name,Value=my-nacl-nacl}]"

### Get AMI for Amazon Linux 2023
AMI_ID=$(aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
--query "Images[?starts_with(Name, 'amzn2')]|sort_by(@, &CreationDate)[-1].ImageId" \
--region us-east-1 \
--output text)

echo "AMI ID: $AMI_ID"

### Create a NACL entry
aws ec2 create-network-acl-entry \
--network-acl-id $NACL_ID \
--ingress \
--region us-east-1 \
--rule-number 90 \
--protocol -1 \
--port-range from=0,to=65535 \
--cidr-block 47.176.7.34/32
--rule-action deny \