require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_list.rb'
require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\student\data_table.rb'

class DataListStudentShort < DataList
  private

  def generate_row_number(index)
    index + 1
  end

  def extract_attributes(object)
    object.to_h.reject { |key, _| key == :id }
  end

  def column_names
    return [] if @objects.empty?

    object = extract_attributes(@objects.first).keys
    object
  end

  def column_types
    rows = @objects.map.with_index do |object, index|
      [generate_row_number(index)] + extract_attributes(object).values
    end

    object = DataTable.new(rows)
    object
  end
end