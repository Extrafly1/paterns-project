require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_base\StudentsListDB.rb'

class StudentListController
  attr_accessor :view, :students_db

  def initialize(view, database_connection)
    @view = view
    @students_db = StudentsListDB.new(database_connection)
    @view.controller = self
  end

  def refresh_data
    students = @students_db.get_all_students
    @view.set_table_params(["ID", "Фамилия", "Имя", "Отчество", "Дата рождения", "Телефон", "Email", "Git", "Telegram"], students.size)
    @view.set_table_data(students)
  end

  def add_student(student)
    @students_db.add_student(student)
    refresh_data
  end

  def edit_student(id, updated_student)
    @students_db.update_student(id, updated_student)
    refresh_data
  end

  def delete_student(id)
    @students_db.delete_student(id)
    refresh_data
  end

  def change_page(direction)
    @view.change_page(direction)
  end
end
