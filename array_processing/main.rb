require_relative 'C:\abc\кубгу\3 курс\патерны проектирования\array_processing\array_processor.rb'

processor = ArrayProcessor.new([1, 2, 3, 4, 5])

puts processor.find { |x| x > 3 }            # Output: 4
puts processor.min_by { |x| -x }              # Output: 5
puts processor.inject(0) { |sum, x| sum + x } # Output: 15
puts processor.one? { |x| x == 3 }             # Output: true
puts processor.flat_map { |x| [x, x * 2] }     # Output: [1, 2, 2, 4, 3, 6, 4, 8, 5, 10]
puts processor.all? { |x| x < 6 }              # Output: true
