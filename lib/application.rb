require_relative "input_switch"

class Application
  def initialize(input_switch, output = $stdout)
    @input = input_switch.input_stream
    @output = output
  end

  def exec
    input_stream = @input.open

    input_stream.each_line do |line|
      @output.puts line
    end

    @input.close
  end
end
