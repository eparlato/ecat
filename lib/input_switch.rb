require_relative "txt_stream_source"
require_relative "file_source"

class InputSwitch
  attr_reader :input_sources
  attr_reader :output

  def initialize(arguments, input_stream = $stdin, output_stream = $stdout)
    @arguments = arguments
    @input_stream = input_stream
    @output_stream = output_stream
  end

  def exec
    @input_sources = []

    if @arguments.empty?
      @input_sources << TxtStreamSource.new(@input_stream)
    else
      @arguments.each { |arg| @input_sources << FileSource.new(arg) }
    end
    
    @output = ConsoleOutput.new(@output_stream)
  end
end
