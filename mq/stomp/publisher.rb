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
client.publish(destination: dest, body: 'Hello, STOMP!')
client.close