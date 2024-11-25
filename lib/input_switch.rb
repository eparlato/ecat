require_relative "txt_stream_input"
require_relative "file_input"

class InputSwitch
  def initialize(argv, io_stream = $stdin)
    @argv = argv
    @io_stream = io_stream
  end

  def input_stream
    if @argv.empty?
      TxtStreamInput.new(@io_stream)
    else
      FileInput.new(@argv.first)
    end
  end
end
