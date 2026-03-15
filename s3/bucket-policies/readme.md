## Create a bucket
aws s3 mb s3://bucket-policy-ao-23234

## Create bucket policy
aws s3api put-bucket-policy --bucket bucket-policy-ao-23234 --policy file://policy.json

## Clean up
aws s3 rb s3://bucket-policy-ao-23234