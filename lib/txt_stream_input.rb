class TxtStreamInput
  def initialize(stdin)
    @stdin = stdin
  end

  def open
    @stdin
  end

  def close
    # do nothing
  end
end