class FileSource
  def initialize(file_path)
    @file_path = file_path
  end

  def print_to(output)
    @file = File.open(@file_path, "r")

    @file.each_line do |line|
      output.print line
    end

    @file.close
  end
end
