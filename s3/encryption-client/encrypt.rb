require "openssl"
require "aws-sdk-s3"
require "pry"

key = OpenSSL::PKey::RSA.generate(1024)

bucket_name = "encryption-client-ao-23234"
object_key = "hello.txt"

# Create a new encryption client
s3 = Aws::S3::EncryptionV2::Client.new(
 encryption_key: key,
 key_wrap_schema: :rsa_oaep_sha1,
 content_encryption_schema: :aes_gcm_no_padding,
 security_profile: :v2
)

# Put object with encryption client
resp = s3.put_object(bucket: bucket_name, key: object_key, body: "handshake")
puts "PUT"
puts resp

# Get object with encryption client
resp = s3.get_object(bucket: bucket_name, key: object_key).body.read
puts "GET"
puts resp  

# Get object without encryption client
client = Aws::S3::Client.new
resp = client.get_object(bucket: bucket_name, key: object_key).body.read
puts "GET WITHOUT KEY"
puts resp