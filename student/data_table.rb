class DataTable
  def initialize(data)
    @data = data
  end

  def get_element(row, col)
    raise "Invalid index" unless row < row_count && col < column_count

    @data[row][col]
  end

  def row_count
    @data.size
  end

  def column_count
    @data[0].size
  end
end