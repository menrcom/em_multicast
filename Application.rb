require 'eventmachine'

class Application
  attr_reader :port
  def initialize(port=0, workers=1)
    @port = port
    @workers = workers
  end

  def run(kind, *args)
      EventMachine.run do
        Signal.trap("INT")  { EventMachine.stop }
        Signal.trap("TERM") { EventMachine.stop }
        Signal.trap("HUP") { EventMachine.stop }
        EventMachine.open_datagram_socket('0.0.0.0', port, kind, *args)
      end
    end
end
