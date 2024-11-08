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

  # Метод для агрегации значений
  def inject(initial = nil, &block)
    accumulator = initial || @array[0]
    start_index = initial.nil? ? 1 : 0

    @array[start_index..-1].each do |element|
      accumulator = block.call(accumulator, element)
    end
    accumulator
  end

  # Метод для проверки, есть ли ровно один элемент, соответствующий условию
  def one?(&block)
    count = 0
    @array.each do |element|
      count += 1 if block.call(element)
      return false if count > 1
    end
    count == 1
  end

  # Метод для "плоской" агрегации массивов
  def flat_map(&block)
    result = []
    @array.each do |element|
      result.concat(block.call(element))
    end
    result
  end

  # Метод для проверки, все ли элементы соответствуют условию
  def all?(&block)
    @array.each do |element|
      return false unless block.call(element)
    end
    true
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
puts processor.inject(0) { |sum, x| sum + x } # Output: 15
puts processor.one? { |x| x == 3 }             # Output: true
puts processor.flat_map { |x| [x, x * 2] }     # Output: [1, 2, 2, 4, 3, 6, 4, 8, 5, 10]
puts processor.all? { |x| x < 6 }              # Output: true
