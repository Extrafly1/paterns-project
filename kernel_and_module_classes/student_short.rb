require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\lab_work_2\base_student.rb'

class Student_short < BaseStudent
  def initialize(student, contact: nil)
    super(id: student.id, git: student.git)
    @surname_initials = "#{student.surname} #{student.name[0]}.#{student.patronymic ? " #{student.patronymic[0]}." : ''}"
    @contact = student.get_contacts || contact
  end

  def to_s
    "ID: #{@id}, ФИО: #{@surname_initials} Git: #{@git ? @git : 'нет'} Контакт: #{@contact ? @contact : 'нет'} "
  end
end