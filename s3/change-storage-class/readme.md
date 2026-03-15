## Create a bucket
aws s3 mb s3://class-fun-ao-23234

## Create a bucket
echo "Hello Uranus" > hello.txt

## Upload a file
aws s3 cp hello.txt s3://class-fun-ao-23234 --storage-class STANDARD_IA

## Clean up
aws s3 rm s3://class-fun-ao-23234/hello.txt
aws s3 rb s3://class-fun-ao-23234