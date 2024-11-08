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

  # Метод для нахождения минимального элемента по условию
  def min_by(&block)
    return nil if @array.empty?

    min_element = @array[0]
    @array.each do |element|
      min_element = element if block.call(element) < block.call(min_element)
    end
    min_element
  end

  # Метод для получения массива
  def to_a
    @array
  end
end

processor = ArrayProcessor.new([1, 2, 3, 4, 5])

# Пример использования методов
puts processor.find { |x| x > 3 }            # Output: 4
puts processor.min_by { |x| -x }              # Output: 5

