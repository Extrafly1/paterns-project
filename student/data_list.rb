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
    name = column_names
    name
  end

  def get_data
    data = column_types
    data
  end

  def column_names
    raise "column_names must be implemented in subclasses"
  end

  def column_types
    raise "column_types must be implemented in subclasses"
  end
end