class Hash
  def pick(*keys)
    Hash.new.tap do |h|
      each do |k, v|
        h[k] = v if keys.include? k
      end
    end
  end

  def except2(*keys)
    reject { |k, _| keys.include? k }
  end

  def compact_values
    select { |_, value| value }
  end

  def defaults(hash)
    Hash.new.tap do |i|
      each {|k, v| h[k] = v}
      hash.each {|k, v| h[k] = v if h[k] == nil }
    end
  end

  def compact_values!
    select! {|_, value| value}
  end

  def except!(*keys)
    reject! {|k, _| keys.include? k}
  end

  def pick!(*keys)
    select! {|k, v| keys.include? k}
  end
end
