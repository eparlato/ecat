class ConsoleOutput
  def initialize(output_stream = $stdout)
    @output_stream = output_stream
  end

  def print(content)
    content.each_line do |line|
      @output_stream.puts line
    end
  end
end
