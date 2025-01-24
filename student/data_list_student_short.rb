require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_list.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_table.rb'

class DataListStudentShort < DataList
  attr_accessor :data, :view

  def initialize
    @data = []
  end

  def notify
    column_names = ["ID", "ФИО", "GIT", "Контакты"]
    @view.set_table_params(column_names, @data.size)
    @view.set_table_data(@data)
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