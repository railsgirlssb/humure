require 'test_helper'

class SensorChangeTest < ActiveSupport::TestCase
  test "expired?" do
    sensor_change = SensorChange.new
    assert_equal true, sensor_change.expired?

    travel_to Time.new(2016, 1, 1, 0, 0, 4) do
      sensor_change = SensorChange.new(field: 'temperature', value: 23.0, updated_at: 2.seconds.ago)
      assert_equal false, sensor_change.expired?

      sensor_change.updated_at = 4.seconds.ago
      assert_equal true, sensor_change.expired?
    end
  end
end
