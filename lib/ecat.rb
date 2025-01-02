require_relative "input_output_switch"
require_relative "application"

class Ecat
  def initialize(input: $stdin, arguments: [], output: $stdout)
    @input = input
    @arguments = arguments
    @output = output
  end

  def run
    Application.new(InputOutputSwitch.new(@arguments, @input, @output)).exec
  end
end
