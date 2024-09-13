def findMinimumWithFor(array)           # найти минимальный элемент в массиве
  min = array[0]                        # принимаем первый элемент как минимальный
  for i in array                        # перебираем остальные
    min = i if i < min                  # если элемент меньше минимального
  end
  min                                    # возвращаем минимальный
end

def findMinimumWithWhile(array)         # найти минимальный элемент в массиве
  min = array[0]                        # принимаем первый элемент как минимальный
  index = 0                             # счетчик
  while index < array.length            # перебираем остальные
    min = array[index] if array[index] < min  # если элемент меньше минимального
    index += 1                          # увеличиваем счетчик
  end
  min                                    # возвращаем минимальный
end

# вызовы функций
array = [-5, 3, 0, -1, 8, 7]
puts findMinimumWithFor(array)
puts findMinimumWithWhile(array)