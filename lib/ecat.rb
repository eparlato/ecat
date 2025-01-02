require_relative "input_switch"
require_relative "application"

class Ecat
  def initialize(input: $stdin, arguments: [], output: $stdout)
    @input = input
    @arguments = arguments
    @output = output
  end

  def run
    input_switch = InputSwitch.new(@arguments, @input)
    input_switch.exec
    Application.new(input_switch.input_sources, ConsoleOutput.new(@output)).exec
  end
end
