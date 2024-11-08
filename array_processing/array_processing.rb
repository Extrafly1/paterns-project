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


