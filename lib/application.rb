require_relative "console_output"

class Application
  def initialize(input_sources, output = ConsoleOutput.new)
    @input_source = input_sources
    @output = output
  end

  def exec
    @input_source.each do |source|
      content = source.open

      @output.print content

      source.close
    end
  end
end
