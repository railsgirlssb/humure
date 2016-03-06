require 'test_helper'

class NumberInRangeByTimeTest < MiniTest::Unit::TestCase
  def test_range
    assert_equal 15, NumberInRangeByTime.integer(seed_value: 2, range: (15..30), unit_duration: 3)

    assert_equal 30, NumberInRangeByTime.integer(seed_value: 47, range: (15..30), unit_duration: 3)
    assert_equal 15, NumberInRangeByTime.integer(seed_value: 48, range: (15..30), unit_duration: 3)
  end
end
