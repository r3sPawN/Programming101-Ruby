# Implementation of our own Enumerable class
module MyEnumerable
  def map
    Array.new.tap do |arr|
      each do |element|
        value = yield element
        arr << value
      end
    end
  end

  def filter
    Array.new.tap do |arr|
      each do |element|
        arr << element if (yield element)
      end
    end
  end

  def first
    element = nil

    each do |x|
      element = x
      break
    end

    element
  end

  def reduce(initial = nil)
    skip_first = false

    if initial.nil?
      initial = first
      skip_first = true
    end

    each do |x|
      if skip_first
        skip_first = false
        next
      end
      initial = yield initial, x
    end

    initial
  end

  def negate_block(&block)
    proc { |x| !block.call(x) }
  end

  def reject(&block)
    filter(negate_block(&block))
  end

  def size
    map { |_| 1 }.reduce(0, &:+)
  end

  def any?(&block)
    filter(&block).size > 0
  end

  def all?(&block)
    filter(&block).size == size
  end

  def include?(element)
    # Your code goes here
  end

  def count(element = nil)
    return size if element.nil?

    filter { |x| x == element }.size
  end

  def min
    reduce {|min, item| min > item ? item : min}
  end

  def min_by
    return enum_for(:max_by) unless block_given?

    reduce {|max, item| (yield max) < (yield item) ? item : max}
  end

  def max
    reduce { |max, item| max < item ? item : max }
  end

  def max_by
    # Your code goes here.
  end

  def take(n)
    [].tap do |array|
      count = 0
      each do |item|
        arr << item if count < n
        count += 1
      end
    end
  end

  def take_while
    [].tap do |arr|
      each do |item|
        arr << item if (yield item)
        break unless (yield element)
      end
    end
  end

  def drop(n)
    [].tap do|arr|
      count = 1
      each do |item|
        arr << item if count > n
        count += 1
      end
    end
  end

  def drop_while
    # Your code goes here.
  end
end
