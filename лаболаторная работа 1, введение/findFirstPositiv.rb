def find_first_positive_index_with_for(array)      # найти первый положительный элемент в массиве
  for index in 0...array.length               # перебираем остальные
    return index if array[index] > 0          # если элемент положительный
  end
  nil                                         # Возвращаем nil, если положительных элементов нет
end

def find_first_positive_index_with_while(array)    # найти первый положительный элемент в массиве
  index = 0                                   # счетчик
  while index < array.length                  # перебираем остальные
    return index if array[index] > 0          # если элемент положительный
    index += 1                                # увеличиваем счетчик
  end
  nil                                         # Возвращаем nil, если положительных элементов нет
end

# вызовы функций
array = [-5, 3, 0, -1, 8, 7]
puts find_first_positive_index_with_for(array)
puts find_first_positive_index_with_while(array)
