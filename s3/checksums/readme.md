## Create a new S3 bucket

```md
aws s3 mb s3://checksums-examples-ab-234
```

## Create a file that will we do a checksum on

```md
echo "Hello Jupiter" > myfile.txt
```

## Gets a checksum of a file

```md
md5sum myfile.txt
```

## Upload our s3 file

```md
aws s3 cp myfile.txt s3://checksums-examples-ab-234
aws s3api head-object --bucket checksums-examples-ab-234 --key myfile.txt
```

## Upload a s3 file with a different checksum

```md
aws s3api put-object \
--bucket checksums-examples-ab-234 \
--key myfilecrc32.txt \
--body myfile.txt \
--checksum-algorithm="SHA1" \
--checksum-sha1="oW3rLsU0SuM/zjpG1izn4erJUw8="
```

## Clean up
aws s3 rm s3://checksums-examples-ab-234/myfile.txt
aws s3 rb s3://checksums-examples-ab-234