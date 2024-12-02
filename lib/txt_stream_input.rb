class TxtStreamInput
  def initialize(io_stream)
    @io_stream = io_stream
  end

  def print_to(output)
    @io_stream.each_line do |line|
      output.puts line
    end
  end
end
