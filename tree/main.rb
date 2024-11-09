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