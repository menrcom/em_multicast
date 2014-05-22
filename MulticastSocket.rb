require 'eventmachine'
require 'ipaddr'
require 'socket'

class MulticastSocket < EventMachine::Connection
  def initialize()
    puts "Initializing new #{self.class} instance"
    super
    optval = IPAddr.new("239.0.0.1").hton + IPAddr.new("0.0.0.0").hton
    set_sock_opt(Socket::IPPROTO_IP, Socket::IP_MULTICAST_IF, optval)
    set_sock_opt(Socket::IPPROTO_IP, Socket::IP_MULTICAST_LOOP, true)
    set_sock_opt(Socket::IPPROTO_IP, Socket::IP_ADD_MEMBERSHIP, optval)
  end
end