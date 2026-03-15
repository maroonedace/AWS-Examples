## Create a bucket
aws s3 mb s3://metadata-fun-ao-23234

## Create a bucket
echo "Hello Uranus" > hello.txt

## Upload a file
aws s3api put-object --bucket metadata-fun-ao-23234 --key hello.txt --body hello.txt --metadata Planet=Uranus

## Get metadata
aws s3api head-object --bucket metadata-fun-ao-23234 --key hello.txt