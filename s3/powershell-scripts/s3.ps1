Import-Module AWS.Tools.S3

$region = "us-west-1"
$bucketName = Read-Host "Enter the bucket name"

Write-Host "S3 Bucket: $bucketName"
Write-Host "S3 Region: $region"

function bucketExists {
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}

if (bucketExists) {
    Write-Host "Bucket already exists..."
}

else { 
    New-S3Bucket -BucketName $bucketName -Region $region
}

$fileName = 'myfile.txt'
$fileContent = 'Hello, World!'
Set-Content -Path $fileName -Value $fileContent

Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName -Region $region
