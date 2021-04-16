# rubocop:disable Lint/ParenthesesAsGroupedExpression

require_relative 'enumerable_methods.rb'
=begin
puts '1.--------my_each--------'
%w[Sharon Leo Leila Brian Arun].my_each { |friend| puts friend }

puts '2.--------my_each_with_index--------'
%w[Sharon Leo Leila Brian Arun].my_each_with_index { |friend, index| puts friend if index.even? }

puts '3.--------my_select--------'
puts (%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' })

puts '4.--------my_all--------'
puts (%w[ant bear cat].my_all? { |word| word.length >= 3 }) #=> true
puts (%w[ant bear cat].my_all? { |word| word.length >= 4 }) #=> false
puts %w[ant bear cat].my_all?(/t/) #=> false
puts %w[ant bat cat].my_all?(/t/) #=> true
puts [1, 2i, 3.14].my_all?(Numeric) #=> true
puts ["Hi", 2i, 3.14].my_all?(Numeric) #=> false
puts [nil, true, 99].all? #=> false
puts [].my_all? #=> true

puts '5.--------my_any--------'
puts (%w[ant bear cat].my_any? { |word| word.length >= 3 }) #=> true
puts (%w[ant bear cat].my_any? { |word| word.length >= 4 }) #=> true
puts %w[ant bear cat].my_any?(/d/) #=> false
puts %w[ant dad bear cat].my_any?(/d/) #=> true
puts [nil, true, 99].my_any?(Integer) #=> true
puts [nil, true, 99].my_any?(true) #=> true
puts [nil, true, 99].my_any?("Hola") #=> false
puts [nil, true, 99].my_any? #=> true
puts [nil, true, 99].any? #=> true
puts [].my_any? #=> false

puts '6.--------my_none--------'
puts (%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
puts (%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
puts %w[ant bear cat].my_none?(/d/) #=> true
puts [1, 3.14, 42].my_none?(Float) #=> false
puts [1, 3.14, 42].my_none?(3.14) #=> false
puts [1, 3.14, 42].my_none?("Hola") #=> true
puts [].my_none? #=> true
puts [nil].my_none? #=> true
puts [nil, false].my_none? #=> true
puts [nil, false, true].my_none? #=> false
=end

puts '7.--------my_count--------'
arr = [1, 2, 4, 2]
#puts arr.my_count #=> 4
puts (1..5).my_count #=> 5
#puts arr.my_count(2) #=> 2
puts (1..5).my_count(2) #=> 1
#puts (arr.my_count { |x| (x % 2).zero? }) #=> 3

=begin
puts '8.--------my_maps--------'
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
puts (my_order.my_map { |item| item.gsub('medium', 'extra large') })
puts ((0..5).my_map { |i| i * i })
puts 'my_map_proc'
my_proc = proc { |i| i * i }
puts (1..5).my_map(&my_proc)

puts '9.--------my_inject--------'
puts ((1..5).my_inject { |sum, n| sum + n }) #=> 15
puts (1..5).my_inject(1) { |product, n| product * n } #=> 120
longest = %w[cat sheep bear].my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
puts longest #=> "sheep"

puts 'multiply_els'
puts multiply_els([2, 4, 5]) #=> 40
=end
# rubocop:enable Lint/ParenthesesAsGroupedExpression
