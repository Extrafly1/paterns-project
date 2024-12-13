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
    raise "get_names must be implemented in subclasses"
  end

  def get_data
    raise "get_data must be implemented in subclasses"
  end
end