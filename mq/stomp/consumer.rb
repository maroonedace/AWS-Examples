require 'stomp'

config = {
    hosts: [
        {
            login: '',
            passcode: '',
            host: 'localhost',
            port: 61613,
            ssl: true,
        }
    ]
}

client = Stomp::Client.new(config)

dest = '/queue/test'

client.subscribe(dest) do |message|
    client.acknowledge(message)
    puts "Received #{message.body}"
end
client.join