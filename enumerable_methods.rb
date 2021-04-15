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
    unless block_given?
      my_each.to_enum
    else
    array = []

      my_each do |element|
        if yield element
          array.push(yield element)
        end
      end

    array
    end
  end

  def my_inject(initial_value = nil, sym = nil)
    accumulator = 0
    if initial_value == nil && sym == nil
      to_a.my_each do |element|
        accumulator = yield(accumulator, element)
      end
      accumulator
    elsif initial_value && sym
      accumulator = accumulator + initial_value
      to_a.my_each do |element|
        accumulator = accumulator.send(sym, element)
      end
      accumulator
    end
  end

  def multiply_els(elements)
    elements.my_inject { |accumulator, element| accumulator * element }
  end

end



# arr = [5, 6, 7, 8]

# p arr.inject { |accumulator, number| accumulator + number }
# p arr.my_inject { |accumulator, number| accumulator + number }

# p arr.inject(1000) { |accumulator, number| accumulator * number }
# p arr.my_inject(1000, :*) { |accumulator, number| accumulator * number }

# Para ejecutar este archivo en irb, debo hacer lo siguiente
=begin
$ irb
>> load './enumerable_methods.rb'
=end
