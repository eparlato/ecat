class FileSource
  def initialize(file_path)
    @file_path = file_path
  end

  def open
    @file = File.open(@file_path, "r")
  end

  def close
    @file.close
  end
end
