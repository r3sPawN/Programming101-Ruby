require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  def test_the_truth
    obj = Object.new
    obj.define_singleton_method(:foo) { 42 }

    assert_equal 42, obj.foo
  end
end
