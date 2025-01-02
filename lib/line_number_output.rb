class LineNumberOutput
  def initialize(output_stream = $stdout)
    @output_stream = output_stream
  end

  def print(content)
    content.each_line.with_index(1) do |line, index|
      @output_stream.puts "#{index}  #{line}"
    end
  end
end
