require_relative "console_output"

class Application
  def initialize(input_sources, output = ConsoleOutput.new)
    @input_source = input_sources
    @output = output
  end

  def exec
    @input_source.each do |source|
      content = source.open

      content.each_line do |line|
        @output.print line
      end

      source.close
    end
  end
end
