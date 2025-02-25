require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\base_student.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_short.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\StudentTree.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_list_student_short.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_list_json.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_list_yaml.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\student_list_base.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\strategy\file_strategy.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\strategy\json_strategy.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\strategy\yaml_strategy.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\students_file_handler.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\StudentListStrategy.rb'

# запись массива студентов в файл
def write_to_txt(file_path, file_name, students)
    raise ArgumentError, "Некорректный адрес файла: #{file_path}" unless File.exist?(File.dirname(file_path))
  
    Dir.mkdir(File.dirname(file_path)) unless Dir.exist?(File.dirname(file_path))
    File.open("#{file_path}/#{file_name}.txt", 'w') do |file|
      students.each do |student|
        file.puts student.to_s
      end
    end
end 

# чтение массива студентов из файла
def self.read_from_txt(file_path)
    raise ArgumentError, "Некорректный адрес файла: #{file_path}" unless File.exist?(file_path)
  
    students = []
    File.open(file_path, 'r') do |file|
      file.each_line do |line|
        students << Student.create_from_string(line.strip)
      end
    end
  
    students
end
    
# Создание объектов
student1 = Student.new(
  surname: 'Иванов',
  name: 'Петр',
  patronymic: 'Алексеевич',
  birth_date: '2000-01-01',
  id: "1"
)

student2 = Student.new(
  surname: 'Сидоров',
  name: 'Сергей',
  patronymic: 'Иванович',
  birth_date: '2000-01-01',
  id: "2",
  phone: '+79162345678',
  telegram: '@sidarov',
  git: "https://github.com/Bagdad1970/repo.git"
)

student3 = Student.new(
  surname: 'Петров',
  name: 'Иван',
  patronymic: 'Александрович',
  birth_date: '2000-01-01',
  id: '3',
  telegram: '@telegram',
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
#students = [
  #Student.create_from_string('ID: 1, Фамилия: Иванов, Имя: Иван, Отчество: Иванович, Дата_рождения: 2000-01-01, Телефон: +79162345678, Телеграм: @ivanov, Почта: ivanov@gmail.com, Гит: https://github.com/Bagdad19/repo.git'),
  #Student.create_from_string('ID: 2, Фамилия: Петров, Имя: Петя, Отчество: Петрович, Дата_рождения: 2000-01-01, Телефон: +98765432101, Телеграм: @petrov, Почта: petrov@gmail.com, Гит: https://github.com/Bagdad1/repo.git'),
#]

# Записываем студентов в файл
# write_to_txt('C:\abc\кубгу\3 курс\патерны проектирования\student', 'data', students)

# Чтение студентов из файла и вывод информации о них
# read_from_txt('C:\abc\кубгу\3 курс\патерны проектирования\student\data.txt').each do |student|
#   puts student.get_info
# end

# Создаем экземпляры Student_short
# student1_short = Student_short.create_from_student(students[0])
# student2_short = Student_short.create_from_student(students[1])

# Выводим информацию о студентах
#puts student1_short.to_s
#puts student2_short.to_s
#puts "\n"

#student3_short = Student_short.create_from_string(students[0].get_info)

#puts students[0].get_info
#puts student3_short.to_s
#puts "Короткий студент валиден? #{student3_short.validate?}"

# test tree

student4 = Student.new(id: "1", surname: 'Иванов', name: 'Иван', patronymic: 'Иванович', birth_date: '2000-01-01')
student5 = Student.new(id: "2", surname: 'Петров', name: 'Петр', patronymic: 'Петрович', birth_date: '1999-05-15')
student6 = Student.new(id: "3", surname: 'Сидоров', name: 'Сидор', patronymic: 'Сидорович', birth_date: '2001-10-20')

tree = StudentTree.new
tree.add(student4)
tree.add(student5)
tree.add(student6)

tree.each { |student| puts student }

puts "\n"

# Получить массив студентов, чьи фамилии начинаются на 'П'
students_with_p = tree.select { |student| student.surname.start_with?('П') }
students_with_p.each { |student| puts student }
puts "\n"
# Найти самого раннего по дате рождения студента
earliest_birth = tree.min_by(&:birth_date)
puts "Самый ранний по дате рождения: #{earliest_birth}"
puts "\n"
# Отсортировать студентов по имени
sorted_by_name = tree.sort_by(&:name)
sorted_by_name.each { |student| puts student }
puts "\n"
# Преобразовать в массив фамилий студентов
surnames = tree.map(&:surname)
puts surnames.inspect

# =======
students = [
  Student_short.create_from_student(student4),
  Student_short.create_from_student(student5),
  Student_short.create_from_student(student6)
]

list = DataListStudentShort.new(students)
puts "Attributes: #{list.get_names}"

data_table = list.get_data
puts "Row count: #{data_table.row_count}"
puts "Column count: #{data_table.column_count}"

puts "First row, second column: #{data_table.get_element(0, 1)}"

json_path = 'C:\abc\кубгу\3 курс\патерны проектирования\student\students.json'
yaml_path = 'C:\abc\кубгу\3 курс\патерны проектирования\student\students.yaml'

json_strategy = StudentsListJSON.new
yaml_strategy = StudentsListYAML.new

json_list = StudentsListBase.new('C:\abc\кубгу\3 курс\патерны проектирования\student\students.json', json_strategy)
yaml_list = StudentsListBase.new('C:\abc\кубгу\3 курс\патерны проектирования\student\students.yaml', yaml_strategy)

json_list.read_all
yaml_list.read_all

json_list.write_all
yaml_list.write_all
# Использование JSON
json_strategy = JSONStrategy.new
json_handler = StudentsFileHandler.new(json_strategy)
json_students = json_handler.read('C:\abc\кубгу\3 курс\патерны проектирования\student\students.json')
puts "JSON Students: #{json_students}"

# Использование YAML
yaml_strategy = YAMLStrategy.new
yaml_handler = StudentsFileHandler.new(yaml_strategy)
yaml_students = yaml_handler.read('C:\abc\кубгу\3 курс\патерны проектирования\student\students.yaml')
puts "YAML Students: #{yaml_students}"

# Запись данных
new_students = [{ id: 1, surname_initials: 'Ivanov I.I.', git: 'ivanov_git' }]
json_handler.write('students_new.json', new_students)
yaml_handler.write('students_new.yaml', new_students)



require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_base\DatabaseConnection.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_base\StudentsListDB.rb'
# Создаём подключение к базе данных
db_connection = DatabaseConnection.instance

# Создаём объект для работы со списком студентов в базе данных
students_list_db = StudentsListDB.new(db_connection)

# Добавляем нового студента
new_student = Student.new(
  id: '4',
  surname: 'Тестов', 
  name: 'Тест', 
  patronymic: 'Тестович', 
  birth_date: '1990-01-01', 
  phone: '+98765432101', 
  email: 'test@example.com', 
  git: 'https://github.com/Bagdad1970/repo.git', 
  telegram: '@test'
)

new_student_id = students_list_db.add_student(new_student)

# Получаем студента по ID
student = students_list_db.get_student_by_id(1)

# Обновляем информацию о студенте
updated_student = Student.new(  
  id: "21",
  surname: 'Измен',
  name: 'Измен',
  patronymic: 'Измен',
  birth_date: '1990-01-01',
  phone: '+98765432101',
  email: 'test@example.com',
  git: 'https://github.com/Bagdad1970/repo.git',
  telegram: '@test'
)
students_list_db.update_student(1, updated_student)

# Получаем количество студентов
student_count = students_list_db.get_student_count

# Удаляем студента
students_list_db.delete_student(new_student_id)
