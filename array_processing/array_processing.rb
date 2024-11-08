# Задача 1: Найти уникальный элемент в массиве
def find_unique_element(array)
  array.find { |element| array.count(element) == 1 }
end


