class StudentListStrategy
  def parse_file(file_path)
    raise NotImplementedError, 'Метод parse_file должен быть реализован в подклассе'
  end

  def save_to_file(file_path, data)
    raise NotImplementedError, 'Метод save_to_file должен быть реализован в подклассе'
  end
end