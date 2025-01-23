require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_list.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_table.rb'

class DataListStudentShort < DataList
  attr_accessor :view

  def initialize(students)
    @students = students
  end

  def notify
    column_names = ["ID", "Фамилия", "Имя"]
    whole_entities_count = @students.size
    data_table = @students.map { |student| [student[0], student[1], student[2]] }

    @view.set_table_params(column_names, whole_entities_count)
    @view.set_table_data(data_table)
  end

  private

  def generate_row_number(index)
    index + 1
  end

  def extract_attributes(object)
    object.to_h.reject { |key, _| key == :id }
  end

  def names
    return [] if @objects.empty?

    object = extract_attributes(@objects.first).keys
    object
  end
end