require_relative "txt_stream_source"
require_relative "file_source"
require_relative "console_output"
require_relative "line_number_output"
require_relative "not_blank_line_number_output"

class InputOutputSwitch
  attr_reader :input_sources
  attr_reader :output

  def initialize(arguments, input_stream = $stdin, output_stream = $stdout)
    @arguments = arguments
    @input_stream = input_stream
    @output_stream = output_stream
  end

  def exec
    @input_sources = select_input_sources
    @output = select_output
  end

  private

  def select_input_sources
    input_sources = []

    if !@arguments.empty?
      @arguments.each do |arg|
        if line_number_option?(arg) || not_blank_line_number_option?(arg)
          next
        end
        input_sources << FileSource.new(arg)
      end
    end

    if has_data?(@input_stream)
      input_sources << TxtStreamSource.new(@input_stream)
    end

    input_sources
  end

  def has_data?(stream)
    if stream.equal?($stdin)
      return stream.stat.pipe? && !stream.eof?
    end

    stream.size > 0
  end

  def select_output
    if @arguments.any? { |arg| arg == "-b" }
      return NotBlankLineNumberOutput.new(@output_stream)
    end

    if @arguments.any? { |arg| arg == "-n" }
      return LineNumberOutput.new(@output_stream)
    end

    ConsoleOutput.new(@output_stream)
  end

  def line_number_option?(text)
    text == "-n"
  end

  def not_blank_line_number_option?(text)
    text == "-b"
  end
end
