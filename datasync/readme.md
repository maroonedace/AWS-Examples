## Create buckets
```sh
aws s3 mb s3://datasync-fun-ab-234
aws s3 mb s3://datasync-fun-ab-234-destination
```

## Create a file
```sh
echo "Hello World" > hello.txt
```

## Upload the file to the source bucket
```sh
aws s3 cp hello.txt s3://datasync-fun-ab-234/data/hello.txt
```