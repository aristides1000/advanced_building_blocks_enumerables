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

    my_each do |element|
      if yield element
        array.push(element)
      end
    end

    array
  end

  def my_all?
    unless block_given?
      my_each do |element|
        if element.nil? || element == false
          return false
        end
      end
    else
      my_each do |element|
        unless yield element || !element.nil? || element == true
          return false
        end
      end
    end
    true

  end

  def my_any?
    unless block_given?
      my_each do |element|
        unless element.nil? || element == false
          return true
        end
      end
    else
      my_each do |element|
        if yield element || !element.nil? || element == true
          return true
        end
        # yield element
      end
    end
    false
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

arr = [nil]

# p arr.any?
# p arr.my_any?

p arr.any? {|a| a.is_a? Integer}
p arr.my_any? {|a| a.is_a? Integer}

# Para ejecutar este archivo en irb, debo hacer lo siguiente
=begin
$ irb
>> load './enumerable_methods.rb'
=end
