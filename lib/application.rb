class Application
  def initialize(output = $stdout)
    @output = output
  end

  def exec(file_path)
    file = File.open(file_path, "r")
    file.each_line do |line|
      @output.puts line
    end
  end
end
