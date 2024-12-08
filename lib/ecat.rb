require_relative "input_switch"
require_relative "application"

class Ecat
  def initialize(argv: [], input: $stdin, output: $stdout)
    @argv = argv
    @input = input
    @output = output
  end

  def run
    input_sources = InputSwitch.new(@argv, @input).select_input_sources
    Application.new(input_sources, ConsoleOutput.new(@output)).exec
  end
end
