class NumberSet
  include Enumerable

  def initialize
    @numbers = []
  end

  def <<(value)
    @numbers << value unless @numbers.include?(value)
  end

  def each(&block)
    @numbers.each(&block)
  end

  def size
    @numbers.size
  end

  def empty?
    @numbers.empty?
  end

  def [](filter)
    @filtered_number_set = NumberSet.new

    @numbers.each do |number|
      @filtered_number_set << number if filter.validate(number)
    end

    @filtered_number_set
  end
end

class Filter
  attr_accessor :block

  def initialize(&block)
    @block = block
  end

  def &(other)
    Filter.new { |number| validate(number) and other.validate(number) }
  end

  def |(other)
    Filter.new { |number| validate(number) or other.validate(number) }
  end

  def validate(number)
    block.call(number)
  end
end

class TypeFilter < Filter
  def initialize(type_of_filter)
    @block = case type_of_filter
                when :complex then ->(number) { number.is_a? Complex }
                when :integer then ->(number) { number.is_a? Integer }
                when :real
                  lambda do |number|
                    number.is_a? Float or number.is_a? Rational
                  end
             end
  end
end

class SignFilter < Filter
  def initialize(type_of_filter)
    @block = case type_of_filter
                when :positive      then ->(number) { number > 0 }
                when :non_positive  then ->(number) { number <= 0 }
                when :negative      then ->(number) { number < 0 }
                when :non_negative  then ->(number) { number >= 0 }
             end
  end
end