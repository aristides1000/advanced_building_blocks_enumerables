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
      end
    end
    false
  end

  def my_none?
    unless block_given?
      my_each do |element|
        unless element.nil? || element == false
          return false
        end
      end
    else
      my_each do |element|
        if yield element || !element.nil? || element == true
          return false
        end
      end
    end
    true
  end

  def my_count(parameter = "empty")
    unless block_given?
      unless parameter == "empty"
        count = 0
        my_each do |element|
          if element == parameter
            count += 1
          end
        end
        return count
      else
        return my_each.length
      end
    else
      count = 0
      my_each do |element|
        if yield element
          count += 1
        end
      end
      return count
    end
  end

  def my_map
    # your code here
  end

  def my_inject
    # your code here
  end

end

arr = [1, 2, 2, 5, 2, 2, 4]

# p arr.count
# p arr.my_count

# p arr.count(2)
# p arr.my_count(2)

# p arr.count { |x| x % 2 == 0 }
# p arr.my_count { |x| x % 2 == 0 }

# Para ejecutar este archivo en irb, debo hacer lo siguiente
=begin
$ irb
>> load './enumerable_methods.rb'
=end
