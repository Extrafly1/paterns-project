class Tag
  attr_reader :name, :attributes, :children

  def initialize(name, attributes = {})
    @name = name
    @attributes = attributes
    @children = []
  end

  def add_child(child)
    @children << child
  end

  def to_s
    attrs = @attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
    attrs_str = attrs.empty? ? '' : " #{attrs}"
    "<#{@name}#{attrs_str}>#{children.map(&:to_s).join}</#{@name}>"
  end

  def text_content
    children.map(&:text_content).join
  end

  def to_boolean
    !children.empty?
  end

  def to_number
    children.size
  end
end

class HtmlTree
  include Enumerable

  def initialize(html)
    @root = parse_html(html)
  end

  def parse_html(html)
    root = Tag.new('root') # Создаем корневой элемент
    stack = [root]
    current_tag = nil

    html.scan(/<\s*(\/?)(\w+)([^>]*)>/) do |slash, tag_name, attrs|
      if slash.empty? # Открывающий тег
        current_tag = Tag.new(tag_name.strip, parse_attributes(attrs.strip))
        stack.last.add_child(current_tag)
        stack.push(current_tag)
      else # Закрывающий тег
        stack.pop
      end
    end

    root
  end

  def parse_attributes(attr_string)
    attributes = {}
    attr_string.scan(/(\w+)="([^"]*)"/) do |key, value|
      attributes[key.to_sym] = value
    end
    attributes
  end

  def each(&block)
    traverse(@root, &block)
  end

  def traverse(node, &block)
    yield node
    node.children.each { |child| traverse(child, &block) }
  end

  def breadth_first_each(&block)
    queue = [@root]
    until queue.empty?
      node = queue.shift
      yield node
      queue.concat(node.children)
    end
  end

  def to_s
    @root.to_s
  end

  def text_content
    @root.text_content
  end
end
