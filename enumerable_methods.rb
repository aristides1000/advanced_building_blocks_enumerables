module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

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
    return to_enum(:my_each_with_index) unless block_given?

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
    return to_enum(:my_select) unless block_given?

    array = []
    my_each do |element|
      array.push(element) if yield element
    end
    array
  end

  def my_all?(parameter = nil)
    if block_given? && parameter.nil?
      my_each do |element|
        return false unless yield element || !element.nil? || element == true
      end
    elsif !block_given? && !parameter.nil?
      my_each do |element|
        if parameter.instance_of?(Regexp)
          return false unless self.include?(parameter)
        else
          return false unless self.instance_of?(Class) != parameter
        end
      end
    elsif !block_given?
      my_each do |element|
        return false if element == false
        return true if element.nil?
      end
    end
    true
  end

  def my_any?(parameter = nil)
    if block_given? && parameter.nil?
      my_each do |element|
        return true unless yield element || !element.nil? || element == true
      end
    elsif !block_given? && !parameter.nil?
      my_each do |element|
        if parameter.instance_of?(Regexp)
          return false unless self.include?(parameter)
        else
          return false unless self.instance_of?(Class) != parameter
        end
      end
    elsif !block_given?
      if self.length > 0
        return true
      else
        return false
      end
    end
    true
  end

  def my_none?(parameter = nil)
    if block_given? && parameter.nil?
      my_each do |element|
        return false unless yield element || !element.nil? || element == true
      end
    elsif !block_given? && !parameter.nil?
      my_each do |element|
        if parameter.instance_of?(Regexp)
          return true unless self.include?(parameter)
        else
          return true unless self.instance_of?(Class) != parameter
        end
      end
    elsif !block_given?
      if self.length > 0
        return false
      else
        return true
      end
    end
    false
  end

  def my_count(parameter = 'empty')
    if block_given?
      count = 0
      my_each do |element|
        count += 1 if yield element
      end
      count
    elsif parameter == 'empty'
      my_each.length
    else
      count = 0
      my_each do |element|
        count += 1 if element == parameter
      end
      count
    end
  end

  def my_map
    if block_given?
      array = []
      my_each do |element|
        array.push(yield element) if yield element
      end
      array
    else
      my_each.to_enum
    end
  end

  def my_inject(initial_value = nil, sym = nil)
    accumulator = 0
    if initial_value.nil? && sym.nil?
      to_a.my_each do |element|
        accumulator = yield(accumulator, element)
      end
      accumulator
    elsif initial_value && sym
      accumulator += initial_value
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
