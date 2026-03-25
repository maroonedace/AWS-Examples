require 'aws-sdk-sqs'

client = Aws::SQS::Client.new(region: 'us-west-2')

resp1 = client.send_message(
    queue_url: 'https://sqs.us-west-2.amazonaws.com/123456789012/MyQueue', 
    message_body: 'Apple',
    delay_seconds: 1,
    message_attributes: {
        'Fruit' => {
            data_type: 'String',
            string_value: 'Apple'
        }
    }
)

puts resp1.message_id

resp2 = client.send_message(
    queue_url: 'https://sqs.us-west-2.amazonaws.com/123456789012/MyQueue', 
    message_body: 'Banana',
    delay_seconds: 2,
    message_attributes: {
        'Fruit' => {
            data_type: 'String',
            string_value: 'Banana'
        }
    }
)

puts resp2.message_id

resp3 = client.send_message(
    queue_url: 'https://sqs.us-west-2.amazonaws.com/123456789012/MyQueue', 
    message_body: 'Cherry',
    delay_seconds: 3,
    message_attributes: {
        'Fruit' => {
            data_type: 'String',
            string_value: 'Cherry'
        }
    }
)
puts resp3.message_id