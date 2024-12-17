require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\tree\html_tree.rb'

html_input = '<div class="container"><h1>Hello World</h1><p>This is a paragraph.</p></div>'
tree = HtmlTree.new(html_input)

puts "HTML Tree Structure:"
puts tree.to_s

puts "Text Content:"
puts tree.text_content

puts "Elements in Depth First:"
tree.each { |tag| puts tag.name }

puts "Elements in Breadth First:"
tree.breadth_first_each { |tag| puts tag.name }

# Пример использования метода `map` для получения имен всех тегов
tag_names = tree.map { |tag| tag.name }
puts "All tag names: #{tag_names.join(', ')}"

# Пример использования метода `select` для выбора тегов с определенным именем
h1_tags = tree.select { |tag| tag.name == 'h1' }
puts "H1 tags: #{h1_tags.map(&:to_s)}"

# Пример использования метода `find` для нахождения первого тега с определенным именем
first_div = tree.find { |tag| tag.name == 'div' }
puts "First div tag: #{first_div}" if first_div

# Пример использования метода `count` для подсчета всех тегов
total_tags = tree.count
puts "Total number of tags: #{total_tags}"

# Пример использования метода `reject` для исключения тегов с определенным именем
non_paragraph_tags = tree.reject { |tag| tag.name == 'p' }
puts "Tags excluding paragraphs: #{non_paragraph_tags.map(&:to_s)}"

# Output:
# HTML Tree Structure:
# <root><div class="container"><h1></h1><p></p></div></root>
# Text Content:

# Elements in Depth First:
# root
# div
# h1
# p
# Elements in Breadth First:
# root
# div
# h1
# p
# All tag names: root, div, h1, p
# H1 tags: ["<h1></h1>"]
# First div tag: <div class="container"><h1></h1><p></p></div>
# Total number of tags: 4
# Tags excluding paragraphs: ["<root><div class=\"container\"><h1></h1><p></p></div></root>", "<div class=\"container\"><h1></h1><p></p></div>", "<h1></h1>"]