if ARGV.empty?                    # если нет аргументов.
  puts "Please enter your name"   # выведем следующее сообщение
  exit                            # выход, добавил чтоб попробовать как прерывается код
else                              # иначе
  name = ARGV[0]                  # присвоим переменной name значение первого аргумента
  puts "Hello #{name}"            # выведем приветствие
end
ARGV.clear                        # очистим массив ARGV

lang = gets.chomp
case lang
when "ruby"
  puts "Всё понятно, подлиза"
when "python"
  puts "Скажи ещё, что тебе 5 лет"
when "java"
  puts "Мог бы подумать по лучше"
when "c++"
  puts "Любишь крыс" 
when "c#"
  puts "А чё не C++?" 
when "go"
  puts "А чё не Java?"
when "kotlin"
  puts "А чё не Python?"
when "php"
  puts "Разлюбишь скоро)"
else
  puts "Я тебя не понимаю"
end

if lang != "ruby"
puts "в любом случае скоро будет Ruby, и это не обсуждается"
end
