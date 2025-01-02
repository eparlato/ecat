require_relative "console_output"

class Application
  def initialize(input_output_switch)
    @input_output_switch = input_output_switch
  end

  def exec
    @input_output_switch.exec

    input_source = @input_output_switch.input_sources
    output = @input_output_switch.output

    input_source.each do |source|
      content = source.open

      output.print content

      source.close
    end
  end
end
