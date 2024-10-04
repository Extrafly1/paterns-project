                                                                          # Третий метод четвёртого задания.
def gcd(a, b)                                                             # функция нахождения НОД
  b.zero? ? a : gcd(b, a % b)                                             # если второй числитель равен нулю, возвращаем первый
end

def sum_of_divisors_relatively_prime(number)                                  # функция подсчета суммы делителей
  sum_of_digits = number.to_s.chars.map(&:to_i).sum                       # сумма цифр
  product_of_digits = number.to_s.chars.map(&:to_i).reduce(1, :*)         # произведение цифр

  sum = 0
  (1..number).each do |i|                                                 # перебираем числа от 1 до number
    if number % i == 0                                                    # если делится
      if gcd(i, sum_of_digits) == 1 && gcd(i, product_of_digits) != 1     # взаимно простые
        sum += i                                                          # суммируем
      end
    end
  end
  sum                                                                     # возвращаем результат
end

puts "Введите целое положительное число: "
number = gets.to_i                                                        # вводим число
puts "Сумма делителей, взаимно простых с суммой цифр и не взаимно простых с произведением цифр: #{sum_of_divisors_relatively_prime(number)}"
