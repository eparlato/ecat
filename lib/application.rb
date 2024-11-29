require_relative "input_switch"

class Application
  def initialize(input_sources, output = $stdout)
    @input_source = input_sources
    @output = output
  end

  def exec
    @input_source.each do |source|
      input_stream = source.open

      input_stream.each_line do |line|
        @output.puts line
      end

      source.close
    end
  end
end
