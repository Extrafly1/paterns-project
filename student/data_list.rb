class DataList
  def initialize(objects)
    @objects = objects
    @selected = []
  end

  def select(number)
    @selected << number unless @selected.include?(number)
  end

  def get_selected
    @selected
  end

  def get_names
    names
  end

  def names
    raise "names must be implemented in subclasses"
  end

  def get_data
    rows = @objects.map.with_index do |object, index|
      [generate_row_number(index)] + extract_attributes(object).values
    end

    object = DataTable.new(rows)
    object
  end

  def generate_row_number(index)
    raise "generate_row_number must be implemented in subclasses"
  end

  def extract_attributes(object)
    raise "extract_attributes must be implemented in subclasses"
  end
end