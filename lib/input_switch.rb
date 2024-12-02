require_relative "txt_stream_source"
require_relative "file_source"

class InputSwitch
  def initialize(argv, io_stream = $stdin)
    @argv = argv
    @io_stream = io_stream
  end

  def select_input_sources
    input_sources = []

    if @argv.empty?
      input_sources << TxtStreamSource.new(@io_stream)
    else
      @argv.each { |arg| input_sources << FileSource.new(arg) }
    end

    input_sources
  end
end
