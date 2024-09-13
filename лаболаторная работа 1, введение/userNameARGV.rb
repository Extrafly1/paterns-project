if ARGV.empty?                    # если нет аргументов
  puts "Please enter your name"   # выведем следующее сообщение
  exit                            # выход, добавил чтоб попробовать как прерывается код
else                              # иначе
  name = ARGV[0]                  # присвоим переменной name значение первого аргумента
  puts "Hello #{name}"            # выведем приветствие
end
ARGV.clear                        # очистим массив ARGV

puts "какой ЯП ты обожаешь???"
lang = gets.chomp
if lang == "ruby"
  puts "всё понятно, подлиза"
elsif lang == "python"
  puts "скажи ещё что тебе 5 лет"
elsif lang == "java"
  puts "мог бы подумать по лучше"
elsif lang == "c++"
  puts "любишь крыс"              # москот языка вздувшаяся чумная крыса с оторваной ногой и вся в язвах
elsif lang == "c#"
  puts "а чё не c++"              # не, ну раз изучил c#, почему не изучил с++
elsif lang == "go"
  puts "а чё не java"
elsif lang == "kotlin"
  puts "а чё не python"
elsif lang == "php"
  puts "разлюбишь скоро)"
else
  puts "я тебя не понимаю"        # ну оригинальные варианты не перебирал
end

if lang != "ruby"
puts "в любом случае скоро будет Ruby, и это не обсуждается"
end

# а вообще адекватнее так

# case lang
# when "ruby"
#   puts "Всё понятно, подлиза"
# when "python"
#   puts "Скажи ещё, что тебе 5 лет"
# when "java"
#   puts "Мог бы подумать по лучше"
# when "c++"
#   puts "Любишь крыс" 
# when "c#"
#   puts "А чё не C++?" 
# when "go"
#   puts "А чё не Java?"
# when "kotlin"
#   puts "А чё не Python?"
# when "php"
#   puts "Разлюбишь скоро)"
# else
#   puts "Я тебя не понимаю"
# end

# но я гавнокодер