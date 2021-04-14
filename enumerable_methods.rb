# https://github.com/ruby/ruby
# https://www.ruby-lang.org/en/
# https://ruby-doc.org/core-2.7.0/Array.html

module Enumerable
  def my_each
    return self.dup unless block_given?

    element = self

    i = 0
    loop do
      yield(element[i])
      i += 1
      break if i == element.length
    end
    self

  end

  def my_each_with_index
    return self.dup unless block_given?

    element = self

    i = 0
    loop do
      yield(element[i], i)
      i += 1
      break if i == element.length
    end
    self
  end

  def my_select
    return self.dup unless block_given?

    array = []

    self.my_each do |element|
      if yield element
        array.push(element)
      end
    end

    array
  end

  def my_all?
    # your code here
  end

  def my_any?
    # your code here
  end

  def my_none?
    # your code here
  end

  def my_count
    # your code here
  end

  def my_map
    # your code here
  end

  def my_inject
    # your code here
  end

end

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

p friends.my_select

p friends.my_select { |friend| friend == 'Brian' }

# Para ejecutar este archivo en irb, debo hacer lo siguiente
=begin
$ irb
>> load './filename.rb'
=end
