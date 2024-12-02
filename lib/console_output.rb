class ConsoleOutput
  def initialize(output_stream = $stdout)
    @output_stream = output_stream
  end

  def print(message)
    @output_stream.puts message
  end
end
