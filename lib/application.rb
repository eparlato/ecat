require_relative "console_output"

class Application
  def initialize(input_sources, output = ConsoleOutput.new)
    @input_source = input_sources
    @output = output
  end

  def exec
    @input_source.each do |source|
      source.print_to(@output)
    end
  end
end
