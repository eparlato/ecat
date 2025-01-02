require_relative "txt_stream_source"
require_relative "file_source"

class InputSwitch
  attr_reader :input_sources

  def initialize(arguments, io_stream = $stdin)
    @arguments = arguments
    @io_stream = io_stream
  end

  def exec
    @input_sources = []

    if @arguments.empty?
      @input_sources << TxtStreamSource.new(@io_stream)
    else
      @arguments.each { |arg| @input_sources << FileSource.new(arg) }
    end
  end
end
