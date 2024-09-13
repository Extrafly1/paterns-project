puts "enter command in Ruby: "
ruby_command = gets.chomp         # вводим команду в Ruby

begin                             # обрабатываем ошибки
  result = eval(ruby_command)     # выполняем команду
  puts result
rescue 
  puts "Error"
end

puts "enter command in OS: "
os_command = gets.chomp           # вводим команду в OS

begin                             # обрабатываем ошибки
  puts "result: "
  system(os_command)              # выполняем команду
rescue
  puts "Error"
end