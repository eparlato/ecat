class TxtStreamSource
  def initialize(io_stream)
    @io_stream = io_stream
  end

  def open
    @io_stream
  end

  def close
    # do nothing
  end
end
