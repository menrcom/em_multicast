require './MulticastSocket'

class MulticastClient < MulticastSocket
  attr_reader :message
  def initialize(a_message)
    @message = a_message
  end
  
  def post_init
    send_datagram(ARGV[0] || message, "239.0.0.1", "65535")
    EventMachine.stop
  end
end
