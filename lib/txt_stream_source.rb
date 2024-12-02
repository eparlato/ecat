class TxtStreamSource
  def initialize(io_stream)
    @io_stream = io_stream
  end

  def print_to(output)
    @io_stream.each_line do |line|
      output.print line
    end
  end
end
