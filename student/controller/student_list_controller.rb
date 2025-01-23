class StudentListController
  attr_reader :students_list

  def initialize(view, students_list_db)
    @view = view
    @students_list = students_list_db  # Используем StudentsListDB для работы с базой данных
    @view.controller = self  # Сохраняем ссылку на контроллер в представлении
  end

  def add_student(student_data)
    student = Student.new(student_data)
    @students_list.add_student(student)
    @view.refresh_student_list(@students_list.get_all_students)
  end

  def update_student(id, updated_data)
    updated_student = Student.new(updated_data)
    @students_list.update_student(id, updated_student)
    @view.refresh_student_list(@students_list.get_all_students)
  end

  def delete_student(id)
    @students_list.delete_student(id)
    @view.refresh_student_list(@students_list.get_all_students)
  end

  def get_student_by_id(id)
    @students_list.get_student_by_id(id)
  end

  def get_student_count
    @students_list.get_student_count
  end
end 