                                                # Первый метод четвёртого задания.
def count_divisors_not_divisible_by_3(number)        # функция подсчета делителей
  count = 0
  (1..number).each do |i|                       # перебираем числа от 1 до number
    if number % i == 0 && i % 3 != 0            # если делится и не делится на 3
      count += 1
    end
  end
  count                                         # возвращаем результат
end

puts "Введите целое положительное число: "
number = gets.to_i                              # вводим число
puts "Количество делителей числа, не делящихся на 3: #{count_divisors_not_divisible_by_3(number)}"
