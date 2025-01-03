class NotBlankLineNumberOutput
  def initialize(output_stream = $stdout)
    @output_stream = output_stream
  end

  def print(content)
    line_index = 1

    content.each_line do |line|
      if line.strip.empty?
        @output_stream.puts
      else
        @output_stream.puts "#{line_index}  #{line}"
        line_index += 1
      end
    end
  end
end