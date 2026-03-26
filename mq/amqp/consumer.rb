require 'bunny'

connection_string = 'amqp://guest:123456@localhost:5672'
connection = Bunny.new(connection_string)
connection.start

channel = connection.create_channel
queue = channel.queue('hello')

begin
    queue.subscribe(block: true) do |_delivery_info, _properties, body|
        puts "Received #{body}"
    end
rescue => e
    puts "Error: #{e}"
    channel.close
    connection.close
    exit(0)
end