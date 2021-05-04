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
        my_hash.each do |v|
          standard_result << v + v
        end
        my_result = []
        my_hash.my_each do |v|
          my_result << v + v
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
end

# rubocop:enable Metrics/BlockLength
