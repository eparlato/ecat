class Application
  def initialize(input, output = $stdout)
    @input = input
    @output = output
  end

  def exec
    input_stream = @input.open

    input_stream.each_line do |line|
      @output.puts line
    end

    @input.close
  end
end
