require_relative "input_switch"

class Application
  def initialize(input_sources, output = $stdout)
    @input_source = input_sources
    @output = output
  end

  def exec
    @input_source.each do |source|
      source.print_to(@output)
    end
  end
end
