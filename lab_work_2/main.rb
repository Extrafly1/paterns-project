require_relative 'student_class'

student1 = Student.new("Иванов", "Иван", "Иванович", "1234567890", "@ivan", "ivan@example.com", "github.com/ivan")
student2 = Student.new("Петров", "Петр", "Петрович", "0987654321", "@petr", "petr@example.com", "github.com/petr")
student3 = Student.new("Сидоров", "Сидор", "Сидорович", "1357924680", "@sidor", "sidor@example.com", "github.com/sidor")

puts student1
puts student2
puts student3
