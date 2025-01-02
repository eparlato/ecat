require_relative "input_switch"
require_relative "application"

class Ecat
  def initialize(argv: [], input: $stdin, output: $stdout)
    @arguments = argv
    @input = input
    @output = output
  end

  def run
    input_switch = InputSwitch.new(@arguments, @input)
    input_switch.exec
    Application.new(input_switch.input_sources, ConsoleOutput.new(@output)).exec
  end
end
