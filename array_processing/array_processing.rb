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
