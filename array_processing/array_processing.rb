# Задача 1: Найти уникальный элемент в массиве
def find_unique_element(array)
  array.find { |element| array.count(element) == 1 }
end

# Задача 2: Найти два наименьших элемента
def find_two_smallest_elements(array)
  sorted_unique = array.uniq.sort
  sorted_unique[0..1]
end

# Задача 3: Найти элемент, наиболее близкий к заданному числу
def find_closest_element(array, target)
  array.min_by { |element| (element - target).abs }
end

# Задача 4: Построить список всех положительных делителей без повторений
def find_positive_divisors(array)
  divisors = array.flat_map { |number| (1..number).select { |i| number % i == 0 } if number.positive? }
  divisors.uniq
end

# Задача 5: Построить новый список из квадратов неотрицательных чисел, меньших 100 и встречающихся более 2 раз
def find_squares_of_repeated(array)
  array.select { |number| number >= 0 && number < 100 }
       .group_by { |number| number }
       .select { |_, occurrences| occurrences.size > 2 }
       .keys
       .map { |number| number**2 }
end


def read_array_from_file(filename)
  File.readlines(filename).map(&:to_i)
end

def read_array_from_keyboard
  puts "Введите числа, разделенные пробелом:"
  gets.chomp.split.map(&:to_i)
end

def main
  puts "Выберите способ ввода данных:"
  puts "1. Чтение из файла"
  puts "2. Чтение с клавиатуры"
  choice = gets.chomp.to_i

  array = []
  if choice == 1
    puts "Введите имя файла:"
    filename = gets.chomp
    array = read_array_from_file(filename)
  elsif choice == 2
    array = read_array_from_keyboard
  else
    puts "Неверный выбор."
    return
  end

  puts "Выберите задачу:"
  puts "1. Найти уникальный элемент"
  puts "2. Найти два наименьших элемента"
  puts "3. Найти ближайший элемент к заданному числу"
  puts "4. Найти положительные делители"
  puts "5. Найти квадраты повторяющихся неотрицательных чисел"
  task_choice = gets.chomp.to_i

  case task_choice
  when 1
    unique_element = find_unique_element(array)
    puts "Уникальный элемент: #{unique_element}"
  when 2
    two_smallest = find_two_smallest_elements(array)
    puts "Два наименьших элемента: #{two_smallest}"
  when 3
    puts "Введите вещественное число R:"
    r = gets.chomp.to_f
    closest_element = find_closest_element(array, r)
    puts "Элемент, ближайший к #{r}: #{closest_element}"
  when 4
    divisors = find_positive_divisors(array)
    puts "Положительные делители: #{divisors}"
  when 5
    squares = find_squares_of_repeated(array)
    puts "Квадраты повторяющихся неотрицательных чисел: #{squares}"
  else
    puts "Неверный выбор задачи."
  end
end

main()