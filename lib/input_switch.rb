require_relative "txt_stream_input"
require_relative "file_input"

class InputSwitch
  def initialize(argv, io_stream = $stdin)
    @argv = argv
    @io_stream = io_stream
  end

  def select_input_sources
    input_sources = []

    if @argv.empty?
      input_sources << TxtStreamInput.new(@io_stream)
    else
      @argv.each { |arg| input_sources << FileInput.new(arg) }
    end

    input_sources
  end
end
