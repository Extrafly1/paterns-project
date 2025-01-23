require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_base\StudentsListDB.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_list_student_short.rb'

class StudentListController
  attr_accessor :view, :students_db, :data_list_student_short

  def initialize(view, database_connection)
    @view = view
    @students_db = StudentsListDB.new(database_connection)
    @data_list_student_short = DataListStudentShort.new
    @data_list_student_short.view = @view # Установите view в data_list_student_short
    @view.controller = self
  end

  def refresh_data
    page_number = @view.current_page + 1
    students_per_page = @view.rows_per_page

    # Убедитесь, что page_number не меньше 1
    page_number = [page_number, 1].max

    begin
      # Получаем список студентов
      students = @students_db.get_k_n_student_short_list(page_number, students_per_page)
      @data_list_student_short.data = students
      @data_list_student_short.notify
    rescue StandardError => e
      puts "Ошибка при обновлении данных: #{e.message}"
    end
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