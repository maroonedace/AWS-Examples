## Create a bucket
aws s3 mb s3://cors2-ao-23234

## Change block public access
aws s3api put-public-access-block \
--bucket cors2-ao-23234 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"

## Create bucket policy
aws s3api put-bucket-policy --bucket cors2-ao-23234 --policy file://policy.json

## Turn on static website
aws s3api put-bucket-website --bucket cors2-ao-23234 --website-configuration file://website.json

## Upload our index.html file
aws s3 cp index.html s3://cors2-ao-23234

## Upload our javascript file
aws s3 cp hello.js s3://cors2-ao-23234

## View the website
http://cors2-ao-23234.s3-website.us-west-1.amazonaws.com

## Create API Gateway with mock response
curl -X POST -H "Content-Type: application/json" https://api.example.com/hello

## Set Cors on our bucket
aws s3api put-bucket-cors --bucket cors2-ao-23234 --cors-configuration file://cors.json

## Clean up
aws s3 rm s3://cors2-ao-23234/index.html
aws s3 rm s3://cors2-ao-23234/hello.js
aws s3 rb s3://cors2-ao-23234
