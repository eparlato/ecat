require_relative "input_switch"
require_relative "application"

class Ecat
  def initialize(input: $stdin, arguments: [], output: $stdout)
    @input = input
    @arguments = arguments
    @output = output
  end

  def run
    input_switch = InputSwitch.new(@arguments, @input, @output)
    input_switch.exec
    Application.new(input_switch.input_sources, input_switch.output).exec
  end
end
