## Create a bucket
aws s3api create-bucket --bucket acl-fun-ao-23234 --region us-east-1

## Create a bucket
echo "Hello Pluto" > hello.txt

## Turn off Block Public Access for ACLS
aws s3api put-public-access-block \
--bucket acl-fun-ao-23234 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"

## See Public Access for Bucket
aws s3api get-public-access-block --bucket acl-fun-ao-23234 

## Change Bucket Ownership
aws s3api put-bucket-ownership-controls \
--bucket acl-fun-ao-23234 \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"

## Get Canonical user id
aws s3api list-buckets --query Owner.ID --output text

## Change ACLs to allow for a user in another AWS account
aws s3api put-bucket-acl \
--bucket acl-fun-ao-23234 \
--access-control-policy file://policy.json

## Clean up
aws s3api delete-bucket --bucket acl-fun-ao-23234