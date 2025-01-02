require_relative "txt_stream_source"
require_relative "file_source"
require_relative "console_output"
require_relative "line_number_output"

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
      @output = ConsoleOutput.new(@output_stream)
    elsif @arguments.size == 1 && @arguments.first == "-n"
      @input_sources << TxtStreamSource.new(@input_stream)
      @output = LineNumberOutput.new(@output_stream)
    else
      @arguments.each do |arg|
        if arg == "-n"
          @output = LineNumberOutput.new(@output_stream)
          next
        end

        @input_sources << FileSource.new(arg)
      end

      @output ||= ConsoleOutput.new(@output_stream)
    end
  end
end
