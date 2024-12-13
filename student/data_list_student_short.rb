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

  public

  def get_names
    return [] if @objects.empty?

    extract_attributes(@objects.first).keys
  end

  def get_data
    rows = @objects.map.with_index do |object, index|
      [generate_row_number(index)] + extract_attributes(object).values
    end

    DataTable.new(rows)
  end
end