class StudentTree
  include Enumerable

  class Node
    attr_accessor :student, :left, :right

    def initialize(student)
      @student = student
      @left = nil
      @right = nil
    end
  end

  def initialize
    @root = nil
  end

  def add(student)
    @root = add_recursive(@root, student)
  end

  def each(&block)
    traverse_in_order(@root, &block)
  end

  private

  def add_recursive(node, student)
    return Node.new(student) if node.nil?

    if student.birth_date < node.student.birth_date
      node.left = add_recursive(node.left, student)
    else
      node.right = add_recursive(node.right, student)
    end

    node
  end

  def traverse_in_order(node, &block)
    return if node.nil?

    traverse_in_order(node.left, &block)
    block.call(node.student)
    traverse_in_order(node.right, &block)
  end
end