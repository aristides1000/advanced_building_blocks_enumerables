# rubocop:disable Metrics/ModuleLength
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength

module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    if instance_of?(Array)
      element = self
    elsif instance_of?(Range) || Hash
      element = to_a
    end

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
      my_each do |_element|
        if parameter.instance_of?(Regexp)
          return false unless include?(parameter)
        else
          return false unless instance_of?(Class) != parameter
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
      my_each do |_element|
        if parameter.instance_of?(Regexp)
          return false unless include?(parameter)
        else
          return false unless instance_of?(Class) != parameter
        end
      end
    elsif !block_given?
      return false if empty?
      return true unless empty?
    end
    true
  end

  def my_none?(parameter = nil)
    if block_given? && parameter.nil?
      my_each do |element|
        return false if yield element || !element.nil? || element == true
      end
    elsif !block_given? && !parameter.nil?
      my_each do |_element|
        if parameter.instance_of?(Regexp)
          return true if include?(parameter)
        elsif instance_of?(Class) != parameter
          return false
        end
      end
    elsif !block_given?
      unless empty?
        my_each do |element|
          return false if element == true
        end
      end
    end
    true
  end

  def my_count(parameter = 'empty')
    if block_given?
      count = 0
      my_each do |element|
        count += 1 if yield element
      end
      count
    elsif parameter == 'empty'
      length
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

    my_each do |element|
      accumulator = self[0] if element.is_a?(String)
    end

    if !initial_value.nil? && sym.nil? && block_given?
      if initial_value.is_a?(Symbol)
        my_each do |_element|
          accumulator = accumulator.method(initial_value).call(obj)
        end
      elsif initial_value.is_a?(Integer)
        accumulator += initial_value
        my_each do |element|
          accumulator = yield(accumulator, element)
        end
        accumulator
      end
      accumulator

    elsif initial_value.nil? && sym.nil? && block_given?
      result = to_a[0]
      to_a[1..].my_each do |element|
        result = yield(result, element)
      end
      result
    end
  end

  def multiply_els(elements)
    elements.my_inject { |accumulator, element| accumulator * element }
  end
end

# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
