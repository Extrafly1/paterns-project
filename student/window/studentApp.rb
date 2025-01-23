require 'fox16'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\controller\student_list_controller.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_base\StudentsListDB.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_base\DatabaseConnection.rb'

include Fox

class StudentApp < FXMainWindow
  attr_accessor :controller

  def initialize(app)
    super(app, "Student Management", width: 800, height: 600)

    # Создаем вкладки
    tab_book = FXTabBook.new(self, opts: LAYOUT_FILL)

    # Первая вкладка
    tab1 = FXTabItem.new(tab_book, "Список студентов")
    tab1_frame = FXHorizontalFrame.new(tab_book, LAYOUT_FILL)
    # Здесь будет содержимое первой вкладки

    # Вторая вкладка
    tab2 = FXTabItem.new(tab_book, "Вкладка 2")
    tab2_frame = FXHorizontalFrame.new(tab_book, LAYOUT_FILL)
    # Здесь будет содержимое второй вкладки

    # Третья вкладка
    tab3 = FXTabItem.new(tab_book, "Вкладка 3")
    tab3_frame = FXHorizontalFrame.new(tab_book, LAYOUT_FILL)
    # Здесь будет содержимое третьей вкладки

    # Создаем экземпляр базы данных
    database_connection = DatabaseConnection.instance
    students_list_db = StudentsListDB.new(database_connection)

    # Создаем контроллер и передаем ему представление
    @controller = StudentListController.new(self, students_list_db)

    # Обработчик закрытия окна
    self.connect(SEL_CLOSE) do
      app.exit
    end
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  # Метод для обновления списка студентов в интерфейсе
  def refresh_student_list(students)
    # Логика для обновления списка студентов в интерфейсе
    puts "Обновленный список студентов:"
    students.each { |student| puts student.to_s }
  end
end

if __FILE__ == $0
  FXApp.new do |app|
    StudentApp.new(app)
    app.create
    app.run
  end
end