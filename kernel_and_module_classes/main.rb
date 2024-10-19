require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\kernel_and_module_classes\base_student.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\kernel_and_module_classes\student.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\kernel_and_module_classes\student_short.rb'

def write_to_txt(file_path, file_name, students)
    raise ArgumentError, "Некорректный адрес файла: #{file_path}" unless File.exist?(File.dirname(file_path))
  
    Dir.mkdir(File.dirname(file_path)) unless Dir.exist?(File.dirname(file_path))
    File.open("#{file_path}/#{file_name}.txt", 'w') do |file|
      students.each do |student|
        file.puts student.to_s
      end
    end
  
    puts "Данные успешно записаны в файл: #{file_path}/#{file_name}"
end 

def self.read_from_txt(file_path)
    raise ArgumentError, "Некорректный адрес файла: #{file_path}" unless File.exist?(file_path)
  
    students = []
    File.open(file_path, 'r') do |file|
      file.each_line do |line|
        students << Student.parse(line.strip)
      end
    end
  
    students
end
    
# Создание объектов
student1 = Student.new(
  surname: 'Иванов',
  name: 'Петр',
  patronymic: 'Алексеевич',
  id: "1"
)

student2 = Student.new(
  surname: 'Сидоров',
  name: 'Сергей',
  patronymic: 'Иванович',
  id: "2",
  phone: '+79162345678',
  telegram: '@sidarov'
  #git: 'https://github.com/Bagdad1970'
)

student3 = Student.new(
  surname: 'Петров',
  name: 'Иван',
  patronymic: 'Александрович',
  id: "3",
  telegram: @telegram,
  email: 'petrov@example.com'
)

# Вывод информации о студентах
puts student1.get_info
puts "\n"
puts student2.get_info
puts "\n"
puts student3.get_info

puts "Студент 1 валиден? #{student1.validate?}"
puts "\n"
puts "Студент 2 валиден? #{student2.validate?}"
puts "\n"
puts "Студент 3 валиден? #{student3.validate?}"

# Создаем несколько студентов
students = [
  Student.parse('ID: 1, Фамилия: Иванов, Имя: Иван, Отчество: Иванович, Телефон: +79162345678, Телеграм: @ivanov, Почта: ivanov@gmail.com, Гит: git@ivanov.ru'),
  Student.parse('ID: 2, Фамилия: Петров, Имя: Петя, Отчество: Петрович, Телефон: +98765432101, Телеграм: @petrov, Почта: petrov@gmail.com, Гит: git@petrov.ru'),
]

# Записываем студентов в файл
write_to_txt('C:\abc\кубгу\3 курс\патерны проектирования\lab_work_2', 'data', students)

# Чтение студентов из файла и вывод информации о них
read_from_txt('C:\abc\кубгу\3 курс\патерны проектирования\lab_work_2\data.txt').each do |student|
  puts student.get_info
end

# Создаем экземпляры Student_short
student1_short = Student_short.new(students[0])
student2_short = Student_short.new(students[1])

# Выводим информацию о студентах
puts student1_short.to_s
puts student2_short.to_s

