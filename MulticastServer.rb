require './MulticastSocket'

class MulticastServer < MulticastSocket
  
  def receive_data(data)
    port, ip = Socket.unpack_sockaddr_in(get_peername)
    puts "Got new \"connection\". IP: #{ip}, port: #{port}"
    puts "data received: #{data}"
  end
end

