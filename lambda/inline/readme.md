# Install SAM CLI

```sh
curl -L sam-cli.zip https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip sam-cli.zip -d sam-cli
sudo ./sam-cli/install
rm -rf sam-cli.zip sam-cli
```

# Install CFN Lint

brew install cfn-lint