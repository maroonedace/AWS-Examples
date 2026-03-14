## Create our bucket
```sh
aws s3 mb s3://prefixes-fun-ab-2343
```

## Create our folder
```sh
aws s3api put-object --bucket="prefixes-fun-ab-2343" --key="hello/"
```

## Create many folders
```sh
aws s3api put-object --bucket="prefixes-fun-ab-2343" --key="hello/dsada/dasda/dads/d/fd/fdfg/df/sdf/df/df/df/sf/sf/sd/fs/dfs/df/sf/sd/fsd/f/sf/s/fs/df/ds/fs/f/sd/fsd/f/sf/sd/fs/f/s/fs/f/sd/fs/f/sf/s/f/sf/s/f/sf/sd/f/sd/fs/f/s/fs/fds"
```