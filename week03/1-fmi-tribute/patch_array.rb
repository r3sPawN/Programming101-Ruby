class Array
  def to_hash
    Hash[*flatten]
  end

  def index_by(&block)
    inject({}) { |b, elements| b.merge!({ block.call(elements) => elements  })  }
  end

  def subarray_count(sub)

  end

  def occurence_count
    zip(map{|items| count(items)}).to_hash
  end
end
