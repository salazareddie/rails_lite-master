require 'webrick'

server = WEBrick::HTTPServer.new :Port => 8080


server.mount_proc '/' do |req, res|
  res.body = 'Hello, all!'
end

trap 'INT' do server.shutdown end

server.start
