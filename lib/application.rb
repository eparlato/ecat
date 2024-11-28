require_relative "input_switch"

class Application
  def initialize(input_source, output = $stdout)
    @input_source = input_source
    @output = output
  end

  def exec
    input_stream = @input_source.open

    input_stream.each_line do |line|
      @output.puts line
    end

    @input_source.close
  end
end
