class StudentsFileHandler
  attr_accessor :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def read(file_path)
    @strategy.read(file_path)
  end

  def write(file_path, data)
    @strategy.write(file_path, data)
  end
end
