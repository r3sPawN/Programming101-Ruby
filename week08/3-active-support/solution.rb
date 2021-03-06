class Object
  def blank?
    return true unless self
    return delete(' ').empty? if instance_of? String
    empty? if respond_to? :empty?
  end

  def present?
    !blank?
  end

  def presence
    self if present?
  end

  def try(method = nil, &block)
    return public_send(method) if method && respond_to?(method)

    instance_eval(&block) if block_given? && !nil?
  end
end

