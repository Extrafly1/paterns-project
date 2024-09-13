def findMinimum(array)                                                                  # найти минимальный элемент в массиве
  min = array[0]                                                                        # принимаем первый элемент как минимальный
  array.each do |i|                                                                     # перебираем остальные
    min = i if i < min                                                                  # если элемент меньше минимального
  end
  min                                                                                   # возвращаем минимальный
end

def findFirstPositiveIndex(array)                                                       # найти первый положительный элемент в массиве
  array.each_with_index do |value, index|                                               # перебираем остальные
    return index if value > 0                                                           # если элемент положительный
  end
  nil                                                                                   # Возвращаем nil, если положительных элементов нет
end

                                                                                        # Основной блок программы
if ARGV.length != 2                                                                     # если количество аргументов не равно 2
  puts "Использование: ruby script.rb <метод> <путь к файлу>" 
  puts "<метод>: 'min' для нахождения минимального элемента, 'firstPositive' для нахождения номера первого положительного элемента"
  exit                                                                                  # выходим из программы
end

method = ARGV[0]                                                                        # метод
filePath = ARGV[1]                                                                      # путь к файлу

                                                                                        # Чтение массива из файла
begin
  array = File.readlines(filePath).map(&:to_i)                                          # считываем массив из файла
rescue Errno::ENOENT                                                                    # если не удалось открыть файл
  puts "Ошибка: Файл не найден."
  exit                                                                                  # выходим из программы
end

                                                                                        # Выполнение выбранного метода
case method                                                                             # выбор метода
when 'min' 
  minValue = findMinimum(array)                                                         # найти минимальный элемент в массиве
  puts "Минимальный элемент: #{minValue}"                                               # вывод на экран
when 'firstPositive'
  firstPositiveIndex = findFirstPositiveIndex(array)                                    # найти первый положительный элемент в массиве
  if firstPositiveIndex.nil?                                                            # если положительных элементов нет
    puts "Положительных элементов нет."
  else
    puts "Номер первого положительного элемента: #{firstPositiveIndex}"
  end
else                                                                                    # если неизвестный метод
  puts "Ошибка: Неизвестный метод '#{method}'. Используйте 'min' или 'firstPositive'."
end
