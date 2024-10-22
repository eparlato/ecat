class Application
  def initialize(input_source, output = $stdout)
    @input = input_stream_from(input_source)
    @output = output
  end

  def exec()
    @input.each_line do |line|
      @output.puts line
    end

    if @input.is_a?(File) && !@input.closed?
      @input.close
      puts "File closed? #{@input.closed?}" 
    end
  end

  private

  def input_stream_from(input_source)
    if input_source.is_a?(String)
      File.open(input_source, "r")
    end
  end
end
