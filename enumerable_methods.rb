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
    # your code here
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

  def test
    my_each { |i, e, o| p "#{i} #{e} #{o}" }
  end

  # test

end

array = [1, 2, 3]

p array.my_each

p array.my_each { |n| p n * 2 }


# Para ejecutar este archivo en irb, debo hacer lo siguiente 
=begin
$ irb
>> load './filename.rb'
=end
