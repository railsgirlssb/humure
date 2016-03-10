require 'test_helper'

class SensorTest < ActiveSupport::TestCase
  test "expired?" do
    sensor = Sensor.new
    assert_equal true, sensor.expired?(:temperature)

    travel_to Time.new(2016, 1, 1, 0, 0, 4) do
      sensor = Sensor.new(temperature: 23.0, temperature_updated_at: 2.seconds.ago)
      assert_equal false, sensor.expired?(:temperature)

      sensor.temperature_updated_at = 4.seconds.ago
      assert_equal true, sensor.expired?(:temperature)
    end
  end
end
