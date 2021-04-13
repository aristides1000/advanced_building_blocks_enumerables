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
    # your code here
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

fruits = ["apple", "banana", "strawberry", "pineapple"]

p fruits.my_each_with_index

fruits.my_each_with_index { |fruit, index| puts fruit if index.even? }


# Para ejecutar este archivo en irb, debo hacer lo siguiente
=begin
$ irb
>> load './filename.rb'
=end
