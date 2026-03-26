require 'bunny'

connection_string = 'amqp://guest:123456@localhost:5672'
connection = Bunny.new(connection_string)
connection.start

channel = connection.create_channel
queue = channel.queue('hello')
exchange = channel.default_exchange

begin
    exchange.publish('Hello World!', routing_key: queue.name)
    channel.close
    connection.close
rescue => e
    puts "Error: #{e}"
    channel.close
    connection.close
    exit(0)
end