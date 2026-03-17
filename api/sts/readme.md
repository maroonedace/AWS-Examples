## Create a user with no permissions
aws iam create-user --user-name sts-machine-user

# Configure the user
aws iam create-access-key --user-name sts-machine-user --output table
aws configure
open ~/.aws/credentials

# Get the caller identity
aws sts get-caller-identity --profile sts

# Ensure the user can not access s3
aws s3 ls --profile sts

## Create a role
chmod u+x bin/deploy
./bin/deploy

## Use new user credentials and assume role

aws iam put-user-policy \
--user-name sts-machine-user \
--policy-name StsAssumePolicy \
--policy-document file://policy.json

aws sts assume-role \
--role-arn arn:aws:iam::779846778159:role/sts-encryption-client-stack-StsRole-MlhykpTYfeP9 \
--role-session-name sts-encryption-client-session \
--profile sts

## Test the assumed role
aws s3 ls --profile assumed


## Clean up

### Tear down the stack via CloudFormation

## Clean up the bucket
aws iam delete-access-key --user-name sts-machine-user --access-key-id AKIA3LET5PUXVYE2GWEW
aws iam delete-user-policy --user-name sts-machine-user --policy-name StsAssumePolicy
aws iam delete-user --user-name sts-machine-user