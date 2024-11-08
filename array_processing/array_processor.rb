class ArrayProcessor
  def initialize(array)
    @array = array.dup.freeze # Дублируем и замораживаем массив для защиты от изменений
  end

  # Метод для поиска первого элемента, соответствующего условию
  def find(&block)
    @array.each do |element|
      return element if block.call(element)
    end
    nil
  end

  def to_a
    @array
  end
end

processor = ArrayProcessor.new([1, 2, 3, 4, 5])

# Пример использования методов
puts processor.find { |x| x > 3 }            # Output: 4

