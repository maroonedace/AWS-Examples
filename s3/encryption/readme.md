## Create a bucket
aws s3 mb s3://encryption-fun-ao-23234

## Create a bucket
echo "Hello Uranus" > hello.txt

## Upload a file with S3 default encryption
aws s3api put-object \
--bucket encryption-fun-ao-23234 \
--key hello.txt \
--body hello.txt \

## Upload a file with KMS encryption
aws s3api put-object \
--bucket encryption-fun-ao-23234 \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms \
--ssekms-key-id 123456789012

## Upload a file with SSE-C encryption
openssl rand -out ssec.key 32

aws s3 cp hello.txt s3://encryption-fun-ao-23234/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key

aws s3 cp s3://encryption-fun-ao-23234/hello.txt hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key

## Clean up
aws s3 rm s3://encryption-fun-ao-23234/hello.txt
aws s3 rb s3://encryption-fun-ao-23234