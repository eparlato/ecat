require_relative "input_output_switch"
require_relative "application"

class Ecat
  def initialize(input: $stdin, arguments: [], output: $stdout)
    @input = input
    @arguments = arguments
    @output = output
  end

  def run
    input_output_switch = InputOutputSwitch.new(@arguments, @input, @output)
    input_output_switch.exec
    Application.new(input_output_switch.input_sources, input_output_switch.output).exec
  end
end
