## Create a bucket
aws s3 mb s3://encryption-client-ao-23234

### Run the encrypt.rb file
ruby encrypt.rb

### Clean up
aws s3 rm s3://encryption-client-ao-23234/hello.txt
aws s3 rb s3://encryption-client-ao-23234