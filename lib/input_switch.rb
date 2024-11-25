require_relative "txt_stream_input"
require_relative "file_input"

class InputSwitch
def initialize(argv, ioStream = STDIN)
    @argv = argv
    @ioStream = ioStream
  end

  def input_stream
    if @argv.empty?
      TxtStreamInput.new(@ioStream)
    else
      FileInput.new(@argv.first)
    end
  end
end