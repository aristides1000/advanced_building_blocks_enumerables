# rubocop:disable Metrics/BlockLength

require 'spec_helper'
require_relative '../enumerable_methods'

my_numbers_array = (1..10).to_a
my_chars_array = ('aa'..'bb').to_a
my_range = (1..10)
my_hash = {
  city: 'manaus',
  state: 'amazonas',
  country: 'brazil',
  population: 2_219_580,
  area_km2: 427
}

RSpec.describe Enumerable do
  context 'Testing #my_each' do
    describe 'for arrays' do
      it 'when the elements are Numbers' do
        standard_result = []
        my_numbers_array.each do |v|
          standard_result << v * v
        end
        my_result = []
        my_numbers_array.my_each do |v|
          my_result << v * v
        end
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Strings' do
        standard_result = []
        my_chars_array.each do |v|
          standard_result << v.upcase
        end
        my_result = []
        my_chars_array.my_each do |v|
          my_result << v.upcase
        end
        expect(my_result).to eql(standard_result)
      end

      it 'when the array is empty' do
        standard_result = []
        [].each do |v|
          standard_result << v
        end
        my_result = []
        [].my_each do |v|
          my_result << v
        end
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_numbers_array.each.class
        my_result = my_numbers_array.my_each.class
        expect(my_result).to eql(standard_result)
      end
    end

    describe 'for hashes' do
      it 'when the hash has numbers and strings as values' do
        standard_result = []
        my_hash.each do |i, v|
          standard_result << "The #{i} is #{v.to_s.capitalize}"
        end
        my_result = []
        my_hash.my_each do |i, v|
          my_result << "The #{i} is #{v.to_s.capitalize}"
        end
        expect(my_result).to eql(standard_result)
      end

      it 'when the hash is empty' do
        standard_result = []
        {}.each do |v|
          standard_result << v
        end
        my_result = []
        {}.my_each do |v|
          my_result << v
        end
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_hash.each.class
        my_result = my_hash.my_each.class
        expect(my_result).to eql(standard_result)
      end
    end

    describe 'for ranges' do
      it 'with numbers' do
        standard_result = []
        my_range.each do |v|
          standard_result << v * v
        end
        my_result = []
        my_range.my_each do |v|
          my_result << v * v
        end
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_range.each.class
        my_result = my_range.my_each.class
        expect(my_result).to eql(standard_result)
      end
    end
  end

  context 'Testing #my_each_with_index' do
    describe 'for arrays' do
      it 'when the elements are Numbers' do
        standard_result = []
        my_numbers_array.each_with_index do |v, i|
          standard_result << v * i
        end
        my_result = []
        my_numbers_array.my_each_with_index do |v, i|
          my_result << v * i
        end
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Strings' do
        standard_result = []
        my_chars_array.each_with_index do |v, i|
          standard_result << i.to_s + " " + (v.upcase)
        end
        my_result = []
        my_chars_array.my_each_with_index do |v, i|
          my_result << i.to_s + " " + (v.upcase)
        end
        expect(my_result).to eql(standard_result)
      end

      it 'when the array is empty' do
        standard_result = []
        [].each_with_index do |v, i|
          standard_result << i.to_s + " " + v
        end
        my_result = []
        [].my_each_with_index do |v, i|
          my_result << i.to_s + " " + v
        end
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_numbers_array.each_with_index.class
        my_result = my_numbers_array.my_each_with_index.class
        expect(my_result).to eql(standard_result)
      end
    end

    describe 'for hashes' do
      it 'when the hash has numbers and strings as values' do
        standard_result = []
        my_hash.each_with_index do |v, i|
          standard_result << i.to_s + ": " + v.to_s
        end
        my_result = []
        my_hash.my_each_with_index do |v, i|
          my_result << i.to_s + ": " + v.to_s
        end
        expect(my_result).to eql(standard_result)
      end

      it 'when the hash is empty' do
        standard_result = []
        {}.each_with_index do |v, i|
          standard_result << i.to_s + ": " + v.to_s
        end
        my_result = []
        {}.my_each_with_index do |v, i|
          my_result << i.to_s + ": " + v.to_s
        end
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_hash.each_with_index.class
        my_result = my_hash.my_each_with_index.class
        expect(my_result).to eql(standard_result)
      end
    end

    describe 'for ranges' do
      it 'with numbers' do
        standard_result = []
        my_range.each_with_index do |v, i|
          standard_result << v * i
        end
        my_result = []
        my_range.my_each_with_index do |v, i|
          my_result << v * i
        end
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_range.each_with_index.class
        my_result = my_range.my_each_with_index.class
        expect(my_result).to eql(standard_result)
      end
    end
  end

  context 'Testing #my_select' do
    describe 'for arrays' do
      it 'when the elements are Numbers' do
        standard_result = my_numbers_array.select do |v|
          v.even?
        end
        my_result = my_numbers_array.my_select do |v|
          v.even?
        end
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Strings' do
        standard_result = my_chars_array.select do |v|
          v.include? 'a'
        end
        my_result = my_chars_array.my_select do |v|
          v.include? 'a'
        end
        expect(my_result).to eql(standard_result)
      end

      it 'when the array is empty' do
        standard_result = [].select do |v|
          v.positive?
        end
        my_result = [].my_select do |v|
          v.positive?
        end
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_numbers_array.select.class
        my_result = my_numbers_array.my_select.class
        expect(my_result).to eql(standard_result)
      end
    end

    describe 'for hashes' do
      it 'when the hash has numbers and strings as values' do
        standard_result = my_hash.select do |_, v|
          v.is_a? String
        end
        my_result = my_hash.my_select do |_, v|
          v.is_a? String
        end
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_hash.select.class
        my_result = my_hash.my_select.class
        expect(my_result).to eql(standard_result)
      end
    end

    describe 'for ranges' do
      it 'with numbers' do
        standard_result = my_range.select { |v| v > 6 }
        my_result = my_range.my_select { |v| v > 6 }
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_range.select.class
        my_result = my_range.my_select.class
        expect(my_result).to eql(standard_result)
      end
    end
  end

  context 'Testing #my_all?' do
    describe 'for arrays' do
      it 'when the elements are Numbers, with a pattern (positive result)' do
        standard_result = my_numbers_array.all?(Numeric)
        my_result = my_numbers_array.my_all?(Numeric)
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Numbers, with a pattern (negative result)' do
        standard_result = my_numbers_array.all?(String)
        my_result = my_numbers_array.my_all?(String)
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Numbers, with a block (positive result)' do
        standard_result = my_numbers_array.all? { |number| number > 0 }
        my_result = my_numbers_array.my_all? { |number| number > 0 }
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Numbers, with a block (negative result)' do
        standard_result = my_numbers_array.all? { |number| number < 5 }
        my_result = my_numbers_array.my_all? { |number| number < 5 }
        expect(my_result).to eql(standard_result)
      end

      it 'when the array is empty' do
        standard_result = [].all?
        my_result = [].my_all?
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Strings (positive result)' do
        standard_result = my_chars_array.all? { |word| word.length >= 2 }
        my_result = my_chars_array.my_all?{ |word| word.length >= 2 }
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Strings (negative result)' do
        standard_result = my_chars_array.all? { |word| word.include?('a') }
        my_result = my_chars_array.my_all?{ |word| word.include?('a') }
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_numbers_array.all?(/t/)
        my_result = my_numbers_array.my_all?(/t/)
        expect(my_result).to eql(standard_result)
      end
    end

    describe 'for hashes' do
      it 'when the hash has numbers and strings as values (negative result)' do
        standard_result = my_hash.all?(String)
        my_result = my_hash.my_all?(String)
        expect(my_result).to eql(standard_result)
      end

      it 'when the hash has numbers and strings as values (positive result)' do
        standard_result = my_hash.all?(Array)
        my_result = my_hash.my_all?(Array)
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_hash.all?.class
        my_result = my_hash.my_all?.class
        expect(my_result).to eql(standard_result)
      end
    end

    describe 'for ranges' do
      it 'with numbers' do
        standard_result = my_range.all? { |v| v > 6 }
        my_result = my_range.my_all? { |v| v > 6 }
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_range.all?.class
        my_result = my_range.my_all?.class
        expect(my_result).to eql(standard_result)
      end
    end
  end

  context 'Testing #my_any?' do
    describe 'for arrays' do
      it 'when the elements are Numbers, with a pattern (positive result)' do
        standard_result = my_numbers_array.any?(Numeric)
        my_result = my_numbers_array.my_any?(Numeric)
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Numbers, with a pattern (negative result)' do
        standard_result = my_numbers_array.any?(String)
        my_result = my_numbers_array.my_any?(String)
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Numbers, with a block (positive result)' do
        standard_result = my_numbers_array.any? { |number| number > 8 }
        my_result = my_numbers_array.my_any? { |number| number > 8 }
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Numbers, with a block (negative result)' do
        standard_result = my_numbers_array.any? { |number| number > 10 }
        my_result = my_numbers_array.my_any? { |number| number > 10 }
        expect(my_result).to eql(standard_result)
      end

      it 'when the array is empty' do
        standard_result = [].any?
        my_result = [].my_any?
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Strings (positive result)' do
        standard_result = my_chars_array.any? { |word| word.include?('b') }
        my_result = my_chars_array.my_any?{ |word| word.include?('b') }
        expect(my_result).to eql(standard_result)
      end

      it 'when the elements are Strings (negative result)' do
        standard_result = my_chars_array.any? { |word| word.include?('z') }
        my_result = my_chars_array.my_any?{ |word| word.include?('z') }
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_numbers_array.any?(/a/)
        my_result = my_numbers_array.my_any?(/a/)
        expect(my_result).to eql(standard_result)
      end
    end

    describe 'for hashes' do
      it 'when the hash has numbers and strings as values (negative result)' do
        standard_result = my_hash.any?(String)
        my_result = my_hash.my_any?(String)
        expect(my_result).to eql(standard_result)
      end

      it 'when the hash has numbers and strings as values (positive result)' do
        standard_result = my_hash.any?(Array)
        my_result = my_hash.my_any?(Array)
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_hash.any?.class
        my_result = my_hash.my_any?.class
        expect(my_result).to eql(standard_result)
      end
    end

    describe 'for ranges' do
      it 'with numbers' do
        standard_result = my_range.any? { |v| v > 6 }
        my_result = my_range.my_any? { |v| v > 6 }
        expect(my_result).to eql(standard_result)
      end

      it 'without a block' do
        standard_result = my_range.any?
        my_result = my_range.my_any?
        expect(my_result).to eql(standard_result)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
