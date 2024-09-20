require_relative 'student_class'

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