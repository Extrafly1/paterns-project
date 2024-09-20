require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\lab_work_2\student_class.rb'

begin
    student1 = Student.new(surname: "Иванов", name: "Иван", patronymic: "Иванович", phone: "+1 234-567-8901", git: "https://github.com/ivan/repo.git")
    puts student1

    student2 = Student.new(surname: "Петров", name: "Петр")
    puts student2

    student3 = Student.new(surname: "Сидоров", name: "Сидор", patronymic: "Сидорович", phone: "1234567890")
    puts student3

    student4 = Student.new(surname: "Кузнецов", name: "Сергей", git: "https://github.com/serezha/repo.git")
    puts student4

rescue ArgumentError => e
    puts e.message
end

begin
    student1 = Student.from_string("Иванов, Иван, Иванович, +1 234-567-8901, @ivan, ivanov@example.com, https://github.com/ivan/repo.git")
    puts student1
  
    student2 = Student.from_string("Петров, Петр")  # Это вызовет ошибку при валидации
    puts student2
  rescue ArgumentError => e
    puts e.message
  end
  
  begin
    student3 = Student.from_string("Сидоров, Сидор, Сидорович, 1234567890")
    puts student3
    # Это вызовет ошибку, так как отсутствует Git URL
  rescue ArgumentError => e
    puts e.message
  end
  
  begin
    student4 = Student.from_string("Кузнецов, Сергей, Сергеевич, +1 234-567-8901, @sergey, sergey@example.com, https://github.com/sergey/repo.git")
    puts student4
  rescue ArgumentError => e
    puts e.message
  end