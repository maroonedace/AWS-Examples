require 'aws-sdk-sqs'

client = Aws::SQS::Client.new(region: 'us-west-2')

queue_url = 'https://sqs.us-west-2.amazonaws.com/123456789012/MyQueue'

resp = client.receive_message(
    queue_url: queue_url, 
    max_number_of_messages: 10, 
    attribute_names: ['All'], 
    message_attribute_names: ['All']
)

puts resp.messages.each do |message|
    puts message.body
    puts message.message_attributes
    handle = message.receipt_handle
    resp = client.delete_message(
        queue_url: queue_url, 
        receipt_handle: handle
    )
end