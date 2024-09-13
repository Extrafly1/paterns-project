                                                                                # Второй метод четвёртого задания
def findMinOddDigit(number)                                                     # функция поиска минимальной нечетной цифры
  odd_digits = number.to_s.chars.select { |char| char.to_i.odd? }.map(&:to_i)   # выбираем нечетные цифры
  odd_digits.empty? ? nil : odd_digits.min                                      # возвращаем минимальную
end

puts "Введите целое положительное число: "
number = gets.to_i                                                              # вводим число
puts "Минимальная нечетная цифра числа: #{findMinOddDigit(number)}"
