# rubocop:disable Metrics/ModuleLength
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Style/EmptyCaseCondition
# rubocop:disable Style/GuardClause
# rubocop:disable Lint/ShadowingOuterLocalVariable
# rubocop:disable Metrics/BlockNesting
# rubocop:disable Lint/ToEnumArguments

module Enumerable
  def my_each
    return to_enum unless block_given?

    array = to_a

    i = 0
    if is_a?(Array) || is_a?(Range)
      while i < array.length
        yield(array[i])
        i += 1
      end
    else
      while i < array.length
        yield([array[i][0], array[i][1]])
        i += 1
      end
    end

    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    if instance_of?(Array)
      element = self
    elsif instance_of?(Range) || Hash
      element = to_a
    end

    i = 0
    loop do
      break if i == element.length

      yield(element[i], i)
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    if is_a?(Array) || is_a?(Range)
      array = []
      my_each do |element|
        array.push(element) if yield element
      end
      array
    else
      hash = {}
      my_each do |i, v|
        hash[i] = v if yield(i, v)
      end
      hash
    end
  end

  def my_all?(parameter = nil)
    if block_given? && parameter.nil?
      my_each do |element|
        return false unless yield element || !element.nil? || element == true
      end
    elsif !block_given? && !parameter.nil?
      my_each do |element|
        if parameter.instance_of?(Regexp)
          return false unless parameter.match(element.to_s)
        elsif parameter.is_a?(Class)
          return false unless [element.class, element.class.superclass].include?(parameter)
        elsif element != parameter
          return false
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

  def my_any?(parameter = nil, &block)
    if block_given? && parameter.nil?
      result = false
      my_each do |element|
        result ||= block.call(element)
      end
      return result
    elsif !block_given? && !parameter.nil?
      my_each do |element|
        if parameter.instance_of?(Regexp)
          if parameter.match(element.to_s)
            return true
          else
            i = 0
            my_each do |element|
              i += 1 if parameter.match(element.to_s)
            end
            return false if i.zero?
          end
        elsif parameter.is_a?(Class)
          return false unless [element.class, element.class.superclass].include?(parameter)
        else
          my_each do |element|
            return true if element == parameter
          end
          return false
        end
      end
    elsif !block_given?
      return !empty? unless is_a?(Range)

      true
    end
    true
  end

  def my_none?(parameter = nil, &block)
    return !my_any?(parameter, &block)
  end

  def my_count(parameter = 'empty')
    if block_given?
      count = 0
      my_each do |element|
        count += 1 if yield element
      end
      count
    elsif parameter == 'empty'
      to_a.length
    else
      count = 0
      my_each do |element|
        count += 1 if element == parameter
      end
      count
    end
  end

  def my_map(parameter = nil)
    return to_enum(:my_map) unless block_given? || parameter

    array = []
    if parameter.nil?
      my_each do |element|
        array.push(yield element) if yield element
      end
    else
      my_each do |element|
        array.push(parameter.call(element))
      end
    end
    array
  end

  # def my_inject(initial_value = nil, sym = nil)
  #   accumulator = 0

  #   raise LocalJumpError.new 'no block given' if initial_value.nil? && sym.nil? && !block_given?

  #   my_each do |element|
  #     accumulator = self[0] if element.is_a?(String)
  #   end

  #   if !initial_value.nil? && sym.nil? && block_given?
  #     case
  #     when initial_value.is_a?(Symbol)
  #       my_each do |_element|
  #         accumulator = accumulator.method(initial_value).call(obj)
  #       end
  #     when initial_value.is_a?(Integer)
  #       accumulator += initial_value
  #       my_each do |element|
  #         accumulator = yield(accumulator, element)
  #       end
  #       accumulator
  #     end
  #     accumulator

  #   elsif initial_value.nil? && sym.nil? && block_given?
  #     result = to_a[0]
  #     to_a[1..].my_each do |element|
  #       result = yield(result, element)
  #     end
  #     result

  #   elsif !initial_value.nil? && sym.nil? && !block_given?
  #     result = to_a[0]
  #     my_each do |element|
  #       result = result.send(initial_value, element)
  #     end
  #     result
  #   end
  # end

  def my_inject(init = nil, sym = nil, &block)
    enum = to_a
    raise(LocalJumpError, 'no block given') if init.nil? && sym.nil? && !block_given?
    return init if enum.empty? && block_given?

    if block_given?
      if init.nil?
        init = enum.drop(1).my_inject(enum[0], &block)
      else
        enum.my_each { |v| init = block.call(init, v) }
      end
    else
      sym, init = init, sym if sym.nil?
      return enum.my_inject(init) { |a, b| a.send(sym, b) }
    end

    init
  end
end

def multiply_els(elements)
  elements.my_inject { |accumulator, element| accumulator * element }
end

# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Style/EmptyCaseCondition
# rubocop:enable Style/GuardClause
# rubocop:enable Lint/ShadowingOuterLocalVariable
# rubocop:enable Metrics/BlockNesting
# rubocop:enable Lint/ToEnumArguments
